%define api.pure full
%locations
%lex-param {bool is_parsing}
%parse-param {struct parse_results& results}
%param {yyscan_t scanner}

%initial-action {
	// I want the locations to use zero-based indexing.
	yylloc = YYLTYPE();
}

%{
#include "parser_p.inl"
%}

%union {
	parse_results* results;
}
%token INTEGRAL_NUMBER_
%token REAL_NUMBER_
%token UNBASED_UNSIZED_LITERAL_
%token CID_
%token EID_
%token SID_
%token SYSID_
%token STRING
%token _01
%token _10
%token _1APOSb0
%token _1APOSB0
%token _1APOSb1
%token _1APOSB1
%token _1APOSbx
%token _1APOSbX
%token _1APOSBx
%token _1APOSBX
%token _1step
%token ACCEPT_ON_
%token ALIAS_
%token ALWAYS_
%token ALWAYS_COMB_
%token ALWAYS_FF_
%token ALWAYS_LATCH_
%token AMPAMPAMP
%token AND_
%token APOSb0
%token APOSB0
%token APOSb1
%token APOSB1
%token APOSOCB
%token ASSERT_
%token ASSIGN_
%token ASSUME_
%token ATAT
%token ATS
%token AUTOMATIC_
%token BEFORE_
%token BEGIN_
%token BIND_
%token BINS_
%token BINSOF_
%token BIT_
%token BREAK_
%token BUF_
%token BUFIF0_
%token BUFIF1_
%token BYTE_
%token CASE_
%token CASEX_
%token CASEZ_
%token CELL_
%token CHANDLE_
%token CHECKER_
%token CLASS_
%token CLOCKING_
%token CMOS_
%token CONFIG_
%token CONST_
%token CONSTANT_
%token CONSTRAINT_
%token CONTEXT_
%token CONTINUE_
%token COVER_
%token COVERGROUP_
%token COVERPOINT_
%token CROSS_
%token DEASSIGN_
%token DEFAULT_
%token DEFPARAM_
%token Derror
%token DESIGN_
%token Dfatal
%token Dfullskew
%token Dhold
%token Dinfo
%token DISABLE_
%token Dnochange
%token DO_
%token DOTS
%token Dperiod
%token DPI
%token DPIMC
%token Drecovery
%token Drecrem
%token Dremoval
%token Droot
%token Dsetup
%token Dsetuphold
%token Dskew
%token Dtimeskew
%token Dunit
%token Dwarning
%token Dwidth
%token EDGE_
%token EG
%token ELSE_
%token END_
%token ENDCASE_
%token ENDCHECKER_
%token ENDCLASS_
%token ENDCLOCKING_
%token ENDCONFIG_
%token ENDFUNCTION_
%token ENDGENERATE_
%token ENDGROUP_
%token ENDINTERFACE_
%token ENDMODULE_
%token ENDPACKAGE_
%token ENDPRIMITIVE_
%token ENDPROGRAM_
%token ENDPROPERTY_
%token ENDSEQUENCE_
%token ENDSPECIFY_
%token ENDTABLE_
%token ENDTASK_
%token ENUM_
%token EVENT_
%token EVENTUALLY_
%token EXPECT_
%token EXPORT_
%token EXTENDS_
%token EXTERN_
%token FINAL_
%token FIRST_MATCH_
%token FOR_
%token FORCE_
%token FOREACH_
%token FOREVER_
%token FORK_
%token FORKJOIN_
%token FS_
%token FUNCTION_
%token GENERATE_
%token GENVAR_
%token GLOBAL_
%token HIGHZ0_
%token HIGHZ1_
%token IF_
%token IFF_
%token IFNONE_
%token IGNORE_BINS_
%token ILLEGAL_BINS_
%token IMPLEMENTS_
%token IMPLIES_
%token IMPORT_
%token INCLUDE_
%token INITIAL_
%token INOUT_
%token INPUT_
%token INSTANCE_
%token INT_
%token INTEGER_
%token INTERCONNECT_
%token INTERFACE_
%token INTERSECT_
%token JOIN_
%token JOIN_ANY_
%token JOIN_NONE_
%token LARGE_
%token LET_
%token LIBLIST_
%token LIBRARY_
%token LOCAL_
%token localCC
%token LOCALPARAM_
%token LOGIC_
%token LONGINT_
%token MACROMODULE_
%token MATCHES_
%token MC
%token MEDIUM_
%token MGG
%token Mincdir
%token MODPORT_
%token MODULE_
%token MS_
%token N0
%token NAND_
%token NEGEDGE_
%token NEN
%token NETTYPE_
%token NEW_
%token NEXTTIME_
%token NMN
%token NMOS_
%token NN
%token NNOSBPLUSCSB
%token NNOSBSCSB
%token NOR_
%token NOSHOWCANCELLED_
%token NOT_
%token NOTIF0_
%token NOTIF1_
%token NS_
%token NULL_
%token OPS
%token OPSCP
%token OPTION_
%token OR_
%token OSBE
%token OSBMG
%token OSBPLUSCSB
%token OSBS
%token OSBSCSB
%token OUTPUT_
%token PACKAGE_
%token PACKED_
%token PARAMETER_
%token PATHPULSED
%token PIPEEG
%token PIPEMG
%token PLUSC
%token PMOS_
%token POSEDGE_
%token PRIMITIVE_
%token PRIORITY_
%token PROGRAM_
%token PROPERTY_
%token PROTECTED_
%token PS_
%token PULL0_
%token PULL1_
%token PULLDOWN_
%token PULLUP_
%token PULSESTYLE_ONDETECT_
%token PULSESTYLE_ONEVENT_
%token PURE_
%token RAND_
%token RANDC_
%token RANDCASE_
%token RANDOMIZE_
%token RANDSEQUENCE_
%token RCMOS_
%token REAL_
%token REALTIME_
%token REF_
%token REG_
%token REJECT_ON_
%token RELEASE_
%token REPEAT_
%token RESTRICT_
%token RETURN_
%token RNMOS_
%token RPMOS_
%token RTRAN_
%token RTRANIF0_
%token RTRANIF1_
%token S_ALWAYS_
%token S_EVENTUALLY_
%token S_NEXTTIME_
%token S_UNTIL_
%token S_UNTIL_WITH_
%token SAMPLE_
%token SCALARED_
%token SCCS
%token SCP
%token SEQUENCE_
%token SG
%token SHORTINT_
%token SHORTREAL_
%token SHOWCANCELLED_
%token SIGNED_
%token SMALL_
%token SOFT_
%token SOLVE_
%token SPECIFY_
%token SPECPARAM_
%token STATIC_
%token stdCC
%token STRING_
%token STRONG_
%token STRONG0_
%token STRONG1_
%token STRUCT_
%token SUPER_
%token SUPPLY0_
%token SUPPLY1_
%token SYNC_ACCEPT_ON_
%token SYNC_REJECT_ON_
%token TABLE_
%token TASK_
%token THIS_
%token THROUGHOUT_
%token TIME_
%token TIMEPRECISION_
%token TIMEUNIT_
%token TRAN_
%token TRANIF0_
%token TRANIF1_
%token TRI_
%token TRI0_
%token TRI1_
%token TRIAND_
%token TRIOR_
%token TRIREG_
%token TYPE_
%token TYPE_OPTION_
%token TYPEDEF_
%token UNION_
%token UNIQUE_
%token UNIQUE0_
%token UNSIGNED_
%token UNTIL_
%token UNTIL_WITH_
%token UNTYPED_
%token US_
%token USE_
%token UWIRE_
%token VAR_
%token VECTORED_
%token VIRTUAL_
%token VOID_
%token WAIT_
%token WAIT_ORDER_
%token WAND_
%token WEAK_
%token WEAK0_
%token WEAK1_
%token WHILE_
%token WILDCARD_
%token WIRE_
%token WITH_
%token WITHIN_
%token WOR_
%token XNOR_
%token XOR_
%token OCBCCB OCBOCBCCBCCB
%nonassoc '=' PLUSE ME SE VE PE AMPE HE PIPEE LLE GGE LLLE GGGE CE CV
%right MG LMG
%right '?' ':'
%left PIPEPIPE
%left AMPAMP
%left '|'
%left '^' TH HT
%left '&'
%left EE BANGE EEE BANGEE EEQ BANGEQ
%left '<' LE '>' GE INSIDE_ DIST_
%nonassoc TAGGED_
%left LL GG LLL GGG
%left '+' '-'
%left '*' '/' '%'
%left SS
%token '!' '~' TAMP TPIPE PLUSPLUS MM
%left OPCP OSBCSB CC '.'

%type<results> action_block
%type<results> action_block_422
%type<results> always_construct
%type<results> always_keyword
%type<results> anonymous_program
%type<results> anonymous_program_151
%type<results> anonymous_program_item
%type<results> ansi_port_declaration
%type<results> ansi_port_declaration_76
%type<results> ansi_port_declaration_77
%type<results> ansi_port_declaration_78
%type<results> ansi_port_declaration_79
%type<results> ansi_port_declaration_80
%type<results> ansi_port_declaration_81
%type<results> array_manipulation_call
%type<results> array_manipulation_call_522
%type<results> array_manipulation_call_523
%type<results> array_method_name
%type<results> array_pattern_key
%type<results> array_range_expression
%type<results> assert_property_statement
%type<results> assertion_item
%type<results> assertion_item_declaration
%type<results> assertion_variable_declaration
%type<results> assignment_operator
%type<results> assignment_pattern
%type<results> assignment_pattern_449
%type<results> assignment_pattern_450
%type<results> assignment_pattern_451
%type<results> assignment_pattern_452
%type<results> assignment_pattern_expression
%type<results> assignment_pattern_expression_453
%type<results> assignment_pattern_expression_type
%type<results> assignment_pattern_key
%type<results> assignment_pattern_net_lvalue
%type<results> assignment_pattern_net_lvalue_454
%type<results> assignment_pattern_variable_lvalue
%type<results> assignment_pattern_variable_lvalue_455
%type<results> associative_dimension
%type<results> assume_property_statement
%type<results> attr_name
%type<results> attr_spec
%type<results> attribute_instance
%type<results> attribute_instance_557
%type<results> bin_identifier
%type<results> binary_module_path_operator
%type<results> binary_operator
%type<results> bind_directive
%type<results> bind_directive_92
%type<results> bind_instantiation
%type<results> bind_target_instance
%type<results> bind_target_instance_list
%type<results> bind_target_instance_list_93
%type<results> bind_target_scope
%type<results> bins_expression
%type<results> bins_expression_349
%type<results> bins_keyword
%type<results> bins_or_empty
%type<results> bins_or_empty_330
%type<results> bins_or_empty_330_330
%type<results> bins_or_empty_330_331
%type<results> bins_or_options
%type<results> bins_or_options_333
%type<results> bins_or_options_334
%type<results> bins_or_options_334_334
%type<results> bins_or_options_336
%type<results> bins_or_options_337
%type<results> bins_or_options_338
%type<results> bins_or_options_338_338
%type<results> bins_selection
%type<results> bins_selection_or_option
%type<results> bins_selection_or_option_345
%type<results> bins_selection_or_option_346
%type<results> bit_select
%type<results> bit_select_544
%type<results> block_event_expression
%type<results> block_identifier
%type<results> block_item_declaration
%type<results> block_item_declaration_245
%type<results> block_item_declaration_246
%type<results> block_item_declaration_247
%type<results> block_item_declaration_248
%type<results> block_item_declaration_249
%type<results> blocking_assignment
%type<results> blocking_assignment_420
%type<results> boolean_abbrev
%type<results> built_in_method_call
%type<results> c_identifier
%type<results> case_expression
%type<results> case_generate_construct
%type<results> case_generate_construct_392
%type<results> case_generate_item
%type<results> case_generate_item_393
%type<results> case_inside_item
%type<results> case_item
%type<results> case_item_442
%type<results> case_item_expression
%type<results> case_keyword
%type<results> case_pattern_item
%type<results> case_pattern_item_443
%type<results> case_statement
%type<results> case_statement_439
%type<results> case_statement_440
%type<results> case_statement_441
%type<results> cast
%type<results> casting_type
%type<results> cell_clause
%type<results> cell_identifier
%type<results> charge_strength
%type<results> checker_declaration
%type<results> checker_declaration_38
%type<results> checker_declaration_38_38
%type<results> checker_declaration_40
%type<results> checker_declaration_40_40
%type<results> checker_declaration_42
%type<results> checker_generate_item
%type<results> checker_identifier
%type<results> checker_instantiation
%type<results> checker_instantiation_382
%type<results> checker_or_generate_item
%type<results> checker_or_generate_item_declaration
%type<results> checker_or_generate_item_declaration_117
%type<results> checker_port_direction
%type<results> checker_port_item
%type<results> checker_port_item_113
%type<results> checker_port_item_114
%type<results> checker_port_item_115
%type<results> checker_port_item_116
%type<results> checker_port_list
%type<results> checker_port_list_112
%type<results> class_constraint
%type<results> class_constructor_declaration
%type<results> class_constructor_declaration_134
%type<results> class_constructor_declaration_135
%type<results> class_constructor_declaration_136
%type<results> class_constructor_declaration_137
%type<results> class_constructor_declaration_138
%type<results> class_constructor_prototype
%type<results> class_constructor_prototype_131
%type<results> class_constructor_prototype_131_131
%type<results> class_declaration
%type<results> class_declaration_43
%type<results> class_declaration_44
%type<results> class_declaration_44_44
%type<results> class_declaration_46
%type<results> class_declaration_46_46
%type<results> class_declaration_48
%type<results> class_declaration_49
%type<results> class_identifier
%type<results> class_item
%type<results> class_item_118
%type<results> class_item_119
%type<results> class_item_120
%type<results> class_item_121
%type<results> class_item_122
%type<results> class_item_qualifier
%type<results> class_method
%type<results> class_method_125
%type<results> class_method_126
%type<results> class_method_127
%type<results> class_method_128
%type<results> class_method_129
%type<results> class_method_130
%type<results> class_new
%type<results> class_property
%type<results> class_property_123
%type<results> class_property_124
%type<results> class_qualifier
%type<results> class_qualifier_543
%type<results> class_scope
%type<results> class_type
%type<results> class_type_183
%type<results> class_variable_identifier
%type<results> clocking_decl_assign
%type<results> clocking_declaration
%type<results> clocking_declaration_463
%type<results> clocking_declaration_464
%type<results> clocking_declaration_465
%type<results> clocking_declaration_466
%type<results> clocking_direction
%type<results> clocking_direction_468
%type<results> clocking_drive
%type<results> clocking_drive_470
%type<results> clocking_event
%type<results> clocking_identifier
%type<results> clocking_item
%type<results> clocking_item_467
%type<results> clocking_skew
%type<results> clockvar
%type<results> clockvar_expression
%type<results> cmos_switch_instance
%type<results> cmos_switch_instance_364
%type<results> cmos_switchtype
%type<results> combinational_body
%type<results> combinational_body_409
%type<results> combinational_entry
%type<results> concatenation
%type<results> concatenation_509
%type<results> concurrent_assertion_item
%type<results> concurrent_assertion_item_258
%type<results> concurrent_assertion_statement
%type<results> cond_pattern
%type<results> cond_predicate
%type<results> cond_predicate_438
%type<results> conditional_expression
%type<results> conditional_expression_532
%type<results> conditional_generate_construct
%type<results> conditional_statement
%type<results> conditional_statement_435
%type<results> conditional_statement_436
%type<results> conditional_statement_437
%type<results> config_declaration
%type<results> config_declaration_94
%type<results> config_declaration_95
%type<results> config_declaration_96
%type<results> config_identifier
%type<results> config_rule_statement
%type<results> consecutive_repetition
%type<results> const_identifier
%type<results> const_or_range_expression
%type<results> constant_assignment_pattern_expression
%type<results> constant_bit_select
%type<results> constant_bit_select_550
%type<results> constant_cast
%type<results> constant_concatenation
%type<results> constant_concatenation_510
%type<results> constant_expression
%type<results> constant_expression_533
%type<results> constant_expression_534
%type<results> constant_expression_535
%type<results> constant_function_call
%type<results> constant_indexed_range
%type<results> constant_let_expression
%type<results> constant_mintypmax_expression
%type<results> constant_multiple_concatenation
%type<results> constant_param_expression
%type<results> constant_part_select_range
%type<results> constant_primary
%type<results> constant_range
%type<results> constant_range_expression
%type<results> constant_select
%type<results> constant_select_551
%type<results> constant_select_551_551
%type<results> constant_select_553
%type<results> constraint_block
%type<results> constraint_block_140
%type<results> constraint_block_item
%type<results> constraint_declaration
%type<results> constraint_declaration_139
%type<results> constraint_expression
%type<results> constraint_expression_143
%type<results> constraint_expression_144
%type<results> constraint_expression_145
%type<results> constraint_identifier
%type<results> constraint_primary
%type<results> constraint_primary_142
%type<results> constraint_prototype
%type<results> constraint_prototype_149
%type<results> constraint_prototype_qualifier
%type<results> constraint_set
%type<results> constraint_set_146
%type<results> continuous_assign
%type<results> controlled_reference_event
%type<results> controlled_timing_check_event
%type<results> cover_cross
%type<results> cover_cross_342
%type<results> cover_point
%type<results> cover_point_327
%type<results> cover_point_327_327
%type<results> cover_point_329
%type<results> cover_point_identifier
%type<results> cover_property_statement
%type<results> cover_sequence_statement
%type<results> cover_sequence_statement_259
%type<results> cover_sequence_statement_260
%type<results> coverage_event
%type<results> coverage_option
%type<results> coverage_spec
%type<results> coverage_spec_or_option
%type<results> coverage_spec_or_option_324
%type<results> coverage_spec_or_option_325
%type<results> covergroup_declaration
%type<results> covergroup_declaration_321
%type<results> covergroup_declaration_322
%type<results> covergroup_declaration_323
%type<results> covergroup_expression
%type<results> covergroup_identifier
%type<results> covergroup_range_list
%type<results> covergroup_range_list_350
%type<results> covergroup_value_range
%type<results> cross_body
%type<results> cross_body_344
%type<results> cross_body_item
%type<results> cross_identifier
%type<results> cross_item
%type<results> cross_set_expression
%type<results> current_state
%type<results> cycle_delay
%type<results> cycle_delay_const_range_expression
%type<results> cycle_delay_range
%type<results> data_declaration
%type<results> data_declaration_153
%type<results> data_declaration_154
%type<results> data_event
%type<results> data_source_expression
%type<results> data_type
%type<results> data_type_169
%type<results> data_type_170
%type<results> data_type_171
%type<results> data_type_172
%type<results> data_type_173
%type<results> data_type_174
%type<results> data_type_175
%type<results> data_type_176
%type<results> data_type_177
%type<results> data_type_178
%type<results> data_type_179
%type<results> data_type_or_implicit
%type<results> data_type_or_void
%type<results> default_clause
%type<results> default_skew
%type<results> deferred_immediate_assert_statement
%type<results> deferred_immediate_assertion_item
%type<results> deferred_immediate_assertion_statement
%type<results> deferred_immediate_assume_statement
%type<results> deferred_immediate_cover_statement
%type<results> defparam_assignment
%type<results> delay_control
%type<results> delay_or_event_control
%type<results> delay_value
%type<results> delay2
%type<results> delay3
%type<results> delay3_188
%type<results> delay3_188_188
%type<results> delayed_data
%type<results> delayed_reference
%type<results> description
%type<results> description_6
%type<results> description_7
%type<results> design_statement
%type<results> design_statement_97
%type<results> design_statement_97_97
%type<results> disable_statement
%type<results> dist_item
%type<results> dist_item_148
%type<results> dist_list
%type<results> dist_list_147
%type<results> dist_weight
%type<results> dotted_identifier
%type<results> dpi_function_import_property
%type<results> dpi_function_proto
%type<results> dpi_import_export
%type<results> dpi_import_export_231
%type<results> dpi_import_export_232
%type<results> dpi_import_export_233
%type<results> dpi_spec_string
%type<results> dpi_task_import_property
%type<results> dpi_task_proto
%type<results> drive_strength
%type<results> dynamic_array_new
%type<results> dynamic_array_new_223
%type<results> dynamic_array_variable_identifier
%type<results> edge_control_specifier
%type<results> edge_control_specifier_508
%type<results> edge_descriptor
%type<results> edge_identifier
%type<results> edge_indicator
%type<results> edge_input_list
%type<results> edge_input_list_413
%type<results> edge_input_list_414
%type<results> edge_sensitive_path_declaration
%type<results> edge_symbol
%type<results> elaboration_system_task
%type<results> elaboration_system_task_82
%type<results> elaboration_system_task_82_82
%type<results> elaboration_system_task_84
%type<results> elaboration_system_task_84_84
%type<results> empty_queue
%type<results> enable_gate_instance
%type<results> enable_gatetype
%type<results> enable_terminal
%type<results> end_edge_offset
%type<results> enum_base_type
%type<results> enum_identifier
%type<results> enum_name_declaration
%type<results> enum_name_declaration_181
%type<results> enum_name_declaration_181_181
%type<results> error_limit_value
%type<results> escaped_identifier
%type<results> event_based_flag
%type<results> event_control
%type<results> event_expression
%type<results> event_expression_432
%type<results> event_expression_433
%type<results> event_trigger
%type<results> expect_property_statement
%type<results> expression
%type<results> expression_536
%type<results> expression_537
%type<results> expression_or_cond_pattern
%type<results> expression_or_dist
%type<results> expression_or_dist_307
%type<results> expression_or_dist_307_307
%type<results> extern_constraint_declaration
%type<results> extern_tf_declaration
%type<results> file_path_spec
%type<results> final_construct
%type<results> finish_number
%type<results> fixed_point_number
%type<results> for_initialization
%type<results> for_initialization_458
%type<results> for_step
%type<results> for_step_460
%type<results> for_step_assignment
%type<results> for_variable_declaration
%type<results> for_variable_declaration_459
%type<results> formal_port_identifier
%type<results> full_edge_sensitive_path_description
%type<results> full_path_description
%type<results> fullskew_timing_check
%type<results> function_body_declaration
%type<results> function_body_declaration_225
%type<results> function_body_declaration_226
%type<results> function_body_declaration_227
%type<results> function_body_declaration_228
%type<results> function_body_declaration_229
%type<results> function_body_declaration_230
%type<results> function_data_type_or_implicit
%type<results> function_declaration
%type<results> function_identifier
%type<results> function_prototype
%type<results> function_statement
%type<results> function_statement_or_null
%type<results> function_statement_or_null_430
%type<results> function_subroutine_call
%type<results> gate_instantiation
%type<results> gate_instantiation_351
%type<results> gate_instantiation_352
%type<results> gate_instantiation_353
%type<results> gate_instantiation_354
%type<results> gate_instantiation_355
%type<results> gate_instantiation_356
%type<results> gate_instantiation_357
%type<results> gate_instantiation_358
%type<results> gate_instantiation_359
%type<results> gate_instantiation_360
%type<results> gate_instantiation_361
%type<results> gate_instantiation_362
%type<results> gate_instantiation_363
%type<results> generate_block
%type<results> generate_block_394
%type<results> generate_block_395
%type<results> generate_block_396
%type<results> generate_block_identifier
%type<results> generate_item
%type<results> generate_region
%type<results> generate_region_389
%type<results> genvar_declaration
%type<results> genvar_expression
%type<results> genvar_identifier
%type<results> genvar_initialization
%type<results> genvar_initialization_390
%type<results> genvar_iteration
%type<results> goto_repetition
%type<results> hierarchical_array_identifier
%type<results> hierarchical_block_identifier
%type<results> hierarchical_btf_identifier
%type<results> hierarchical_btf_identifier_326
%type<results> hierarchical_event_identifier
%type<results> hierarchical_identifier
%type<results> hierarchical_identifier_558
%type<results> hierarchical_identifier_559
%type<results> hierarchical_instance
%type<results> hierarchical_instance_372
%type<results> hierarchical_net_identifier
%type<results> hierarchical_parameter_identifier
%type<results> hierarchical_property_identifier
%type<results> hierarchical_sequence_identifier
%type<results> hierarchical_task_identifier
%type<results> hierarchical_tf_identifier
%type<results> hierarchical_variable_identifier
%type<results> hold_timing_check
%type<results> identifier
%type<results> identifier_list
%type<results> identifier_list_150
%type<results> if_generate_construct
%type<results> if_generate_construct_391
%type<results> immediate_assertion_statement
%type<results> implicit_class_handle
%type<results> implicit_data_type
%type<results> implicit_data_type_180
%type<results> import_export
%type<results> inc_or_dec_expression
%type<results> inc_or_dec_expression_530
%type<results> inc_or_dec_expression_531
%type<results> inc_or_dec_operator
%type<results> include_statement
%type<results> index_variable_identifier
%type<results> indexed_range
%type<results> init_val
%type<results> initial_construct
%type<results> inout_declaration
%type<results> inout_port_identifier
%type<results> inout_terminal
%type<results> input_declaration
%type<results> input_identifier
%type<results> input_port_identifier
%type<results> input_terminal
%type<results> inside_expression
%type<results> inst_clause
%type<results> inst_name
%type<results> inst_name_99
%type<results> instance_identifier
%type<results> integer_atom_type
%type<results> integer_covergroup_expression
%type<results> integer_type
%type<results> integer_vector_type
%type<results> integral_number
%type<results> interface_ansi_header
%type<results> interface_ansi_header_27
%type<results> interface_ansi_header_28
%type<results> interface_class_declaration
%type<results> interface_class_declaration_51
%type<results> interface_class_declaration_51_51
%type<results> interface_class_declaration_53
%type<results> interface_class_item
%type<results> interface_class_item_54
%type<results> interface_class_method
%type<results> interface_class_type
%type<results> interface_class_type_50
%type<results> interface_declaration
%type<results> interface_declaration_20
%type<results> interface_declaration_21
%type<results> interface_declaration_22
%type<results> interface_declaration_23
%type<results> interface_declaration_24
%type<results> interface_identifier
%type<results> interface_instance_identifier
%type<results> interface_instantiation
%type<results> interface_instantiation_380
%type<results> interface_item
%type<results> interface_nonansi_header
%type<results> interface_nonansi_header_25
%type<results> interface_nonansi_header_26
%type<results> interface_or_generate_item
%type<results> interface_or_generate_item_104
%type<results> interface_or_generate_item_105
%type<results> interface_or_generate_item_106
%type<results> interface_port_declaration
%type<results> interface_port_header
%type<results> interface_port_header_75
%type<results> join_keyword
%type<results> jump_statement
%type<results> let_actual_arg
%type<results> let_declaration
%type<results> let_declaration_309
%type<results> let_declaration_309_309
%type<results> let_expression
%type<results> let_expression_314
%type<results> let_expression_315
%type<results> let_expression_315_315
%type<results> let_formal_type
%type<results> let_identifier
%type<results> let_list_of_arguments
%type<results> let_list_of_arguments_317
%type<results> let_list_of_arguments_318
%type<results> let_list_of_arguments_319
%type<results> let_list_of_arguments_320
%type<results> let_port_item
%type<results> let_port_item_312
%type<results> let_port_item_313
%type<results> let_port_list
%type<results> let_port_list_311
%type<results> level_input_list
%type<results> level_input_list_412
%type<results> level_symbol
%type<results> level_symbol_0n
%type<results> liblist_clause
%type<results> liblist_clause_100
%type<results> library_declaration
%type<results> library_declaration_1
%type<results> library_declaration_2
%type<results> library_declaration_2_2
%type<results> library_description
%type<results> library_identifier
%type<results> library_text
%type<results> library_text_0
%type<results> lifetime
%type<results> limit_value
%type<results> list_of_arguments
%type<results> list_of_arguments_518
%type<results> list_of_arguments_519
%type<results> list_of_arguments_520
%type<results> list_of_checker_port_connections
%type<results> list_of_checker_port_connections_383
%type<results> list_of_checker_port_connections_384
%type<results> list_of_clocking_decl_assign
%type<results> list_of_clocking_decl_assign_469
%type<results> list_of_cross_items
%type<results> list_of_cross_items_343
%type<results> list_of_defparam_assignments
%type<results> list_of_defparam_assignments_190
%type<results> list_of_genvar_identifiers
%type<results> list_of_genvar_identifiers_191
%type<results> list_of_interface_identifiers
%type<results> list_of_interface_identifiers_192
%type<results> list_of_interface_identifiers_193
%type<results> list_of_interface_identifiers_193_193
%type<results> list_of_net_assignments
%type<results> list_of_net_assignments_417
%type<results> list_of_net_decl_assignments
%type<results> list_of_net_decl_assignments_195
%type<results> list_of_param_assignments
%type<results> list_of_param_assignments_196
%type<results> list_of_parameter_assignments
%type<results> list_of_parameter_assignments_369
%type<results> list_of_parameter_assignments_370
%type<results> list_of_path_delay_expressions
%type<results> list_of_path_inputs
%type<results> list_of_path_inputs_487
%type<results> list_of_path_outputs
%type<results> list_of_path_outputs_488
%type<results> list_of_port_connections
%type<results> list_of_port_connections_374
%type<results> list_of_port_connections_375
%type<results> list_of_port_declarations
%type<results> list_of_port_declarations_63
%type<results> list_of_port_declarations_63_63
%type<results> list_of_port_declarations_63_64
%type<results> list_of_port_declarations_63_64_64
%type<results> list_of_port_identifiers
%type<results> list_of_port_identifiers_197
%type<results> list_of_port_identifiers_198
%type<results> list_of_port_identifiers_198_198
%type<results> list_of_ports
%type<results> list_of_ports_62
%type<results> list_of_specparam_assignments
%type<results> list_of_specparam_assignments_201
%type<results> list_of_tf_variable_identifiers
%type<results> list_of_tf_variable_identifiers_202
%type<results> list_of_tf_variable_identifiers_203
%type<results> list_of_tf_variable_identifiers_204
%type<results> list_of_tf_variable_identifiers_204_204
%type<results> list_of_type_assignments
%type<results> list_of_type_assignments_206
%type<results> list_of_udp_port_identifiers
%type<results> list_of_udp_port_identifiers_200
%type<results> list_of_variable_assignments
%type<results> list_of_variable_assignments_418
%type<results> list_of_variable_decl_assignments
%type<results> list_of_variable_decl_assignments_207
%type<results> list_of_variable_identifiers
%type<results> list_of_variable_identifiers_208
%type<results> list_of_variable_identifiers_209
%type<results> list_of_variable_identifiers_209_209
%type<results> list_of_variable_port_identifiers
%type<results> list_of_variable_port_identifiers_211
%type<results> list_of_variable_port_identifiers_212
%type<results> list_of_variable_port_identifiers_212_212
%type<results> local_parameter_declaration
%type<results> loop_generate_construct
%type<results> loop_statement
%type<results> loop_statement_456
%type<results> loop_statement_457
%type<results> loop_variables
%type<results> loop_variables_461
%type<results> loop_variables_462
%type<results> member_identifier
%type<results> method_call
%type<results> method_call_body
%type<results> method_call_body_521
%type<results> method_call_root
%type<results> method_identifier
%type<results> method_prototype
%type<results> method_qualifier
%type<results> method_qualifier_133
%type<results> mintypmax_expression
%type<results> modport_clocking_declaration
%type<results> modport_declaration
%type<results> modport_declaration_251
%type<results> modport_identifier
%type<results> modport_item
%type<results> modport_item_252
%type<results> modport_ports_declaration
%type<results> modport_ports_declaration_253
%type<results> modport_ports_declaration_254
%type<results> modport_ports_declaration_255
%type<results> modport_simple_port
%type<results> modport_simple_ports_declaration
%type<results> modport_simple_ports_declaration_256
%type<results> modport_tf_port
%type<results> modport_tf_ports_declaration
%type<results> modport_tf_ports_declaration_257
%type<results> module_ansi_header
%type<results> module_ansi_header_12
%type<results> module_ansi_header_13
%type<results> module_ansi_header_14
%type<results> module_common_item
%type<results> module_declaration
%type<results> module_declaration_15
%type<results> module_declaration_16
%type<results> module_declaration_17
%type<results> module_declaration_18
%type<results> module_declaration_19
%type<results> module_identifier
%type<results> module_instantiation
%type<results> module_instantiation_367
%type<results> module_item
%type<results> module_keyword
%type<results> module_nonansi_header
%type<results> module_nonansi_header_10
%type<results> module_nonansi_header_11
%type<results> module_nonansi_header_8
%type<results> module_nonansi_header_9
%type<results> module_or_generate_item
%type<results> module_or_generate_item_86
%type<results> module_or_generate_item_87
%type<results> module_or_generate_item_88
%type<results> module_or_generate_item_89
%type<results> module_or_generate_item_90
%type<results> module_or_generate_item_declaration
%type<results> module_path_concatenation
%type<results> module_path_concatenation_511
%type<results> module_path_conditional_expression
%type<results> module_path_conditional_expression_538
%type<results> module_path_expression
%type<results> module_path_expression_539
%type<results> module_path_expression_540
%type<results> module_path_mintypmax_expression
%type<results> module_path_multiple_concatenation
%type<results> module_path_primary
%type<results> mos_switch_instance
%type<results> mos_switchtype
%type<results> multiple_concatenation
%type<results> n_input_gate_instance
%type<results> n_input_gate_instance_365
%type<results> n_input_gatetype
%type<results> n_output_gate_instance
%type<results> n_output_gate_instance_366
%type<results> n_output_gatetype
%type<results> name_of_instance
%type<results> name_of_instance_373
%type<results> named_checker_port_connection
%type<results> named_checker_port_connection_386
%type<results> named_checker_port_connection_387
%type<results> named_checker_port_connection_388
%type<results> named_parameter_assignment
%type<results> named_parameter_assignment_371
%type<results> named_port_connection
%type<results> named_port_connection_377
%type<results> named_port_connection_378
%type<results> named_port_connection_379
%type<results> ncontrol_terminal
%type<results> net_alias
%type<results> net_alias_419
%type<results> net_assignment
%type<results> net_decl_assignment
%type<results> net_decl_assignment_214
%type<results> net_declaration
%type<results> net_declaration_157
%type<results> net_declaration_158
%type<results> net_declaration_159
%type<results> net_declaration_160
%type<results> net_declaration_161
%type<results> net_declaration_162
%type<results> net_declaration_163
%type<results> net_declaration_163_163
%type<results> net_identifier
%type<results> net_lvalue
%type<results> net_lvalue_554
%type<results> net_port_header
%type<results> net_port_header_74
%type<results> net_port_type
%type<results> net_port_type_184
%type<results> net_type
%type<results> net_type_declaration
%type<results> net_type_declaration_167
%type<results> net_type_declaration_167_167
%type<results> net_type_identifier
%type<results> next_state
%type<results> nochange_timing_check
%type<results> non_consecutive_repetition
%type<results> non_integer_type
%type<results> non_port_interface_item
%type<results> non_port_module_item
%type<results> non_port_module_item_91
%type<results> non_port_program_item
%type<results> non_port_program_item_107
%type<results> non_port_program_item_108
%type<results> non_port_program_item_109
%type<results> non_port_program_item_110
%type<results> non_port_program_item_111
%type<results> nonblocking_assignment
%type<results> nonblocking_assignment_421
%type<results> nonrange_select
%type<results> nonrange_select_548
%type<results> nonrange_select_548_548
%type<results> nonrange_variable_lvalue
%type<results> notifier
%type<results> number
%type<results> open_range_list
%type<results> open_range_list_445
%type<results> open_value_range
%type<results> operator_assignment
%type<results> opt_dotted_identifier
%type<results> ordered_checker_port_connection
%type<results> ordered_checker_port_connection_385
%type<results> ordered_parameter_assignment
%type<results> ordered_port_connection
%type<results> ordered_port_connection_376
%type<results> output_declaration
%type<results> output_identifier
%type<results> output_port_identifier
%type<results> output_symbol
%type<results> output_terminal
%type<results> overload_declaration
%type<results> overload_operator
%type<results> overload_proto_formals
%type<results> overload_proto_formals_250
%type<results> package_declaration
%type<results> package_declaration_55
%type<results> package_declaration_56
%type<results> package_declaration_56_56
%type<results> package_declaration_58
%type<results> package_export_declaration
%type<results> package_export_declaration_156
%type<results> package_identifier
%type<results> package_import_declaration
%type<results> package_import_declaration_155
%type<results> package_import_item
%type<results> package_item
%type<results> package_or_generate_item_declaration
%type<results> package_scope
%type<results> packed_dimension
%type<results> par_block
%type<results> par_block_426
%type<results> par_block_427
%type<results> parallel_edge_sensitive_path_description
%type<results> parallel_path_description
%type<results> parallel_path_description_486
%type<results> param_assignment
%type<results> param_assignment_215
%type<results> param_assignment_216
%type<results> param_expression
%type<results> parameter_declaration
%type<results> parameter_identifier
%type<results> parameter_override
%type<results> parameter_port_declaration
%type<results> parameter_port_list
%type<results> parameter_port_list_60
%type<results> parameter_port_list_61
%type<results> parameter_value_assignment
%type<results> parameter_value_assignment_368
%type<results> part_select_range
%type<results> pass_en_switchtype
%type<results> pass_enable_switch_instance
%type<results> pass_switch_instance
%type<results> pass_switchtype
%type<results> path_declaration
%type<results> path_delay_expression
%type<results> path_delay_value
%type<results> pattern
%type<results> pattern_446
%type<results> pattern_447
%type<results> pattern_448
%type<results> pcontrol_terminal
%type<results> period_timing_check
%type<results> polarity_operator
%type<results> port
%type<results> port_72
%type<results> port_declaration
%type<results> port_declaration_67
%type<results> port_declaration_68
%type<results> port_declaration_69
%type<results> port_declaration_70
%type<results> port_declaration_71
%type<results> port_direction
%type<results> port_expression
%type<results> port_expression_73
%type<results> port_identifier
%type<results> port_reference
%type<results> primary
%type<results> primary_541
%type<results> primary_542
%type<results> primary_literal
%type<results> procedural_assertion_statement
%type<results> procedural_continuous_assignment
%type<results> procedural_timing_control
%type<results> procedural_timing_control_statement
%type<results> production
%type<results> production_473
%type<results> production_474
%type<results> production_475
%type<results> production_identifier
%type<results> production_item
%type<results> program_ansi_header
%type<results> program_ansi_header_36
%type<results> program_ansi_header_37
%type<results> program_declaration
%type<results> program_declaration_29
%type<results> program_declaration_30
%type<results> program_declaration_31
%type<results> program_declaration_32
%type<results> program_declaration_33
%type<results> program_generate_item
%type<results> program_identifier
%type<results> program_instantiation
%type<results> program_instantiation_381
%type<results> program_item
%type<results> program_nonansi_header
%type<results> program_nonansi_header_34
%type<results> program_nonansi_header_35
%type<results> property_actual_arg
%type<results> property_case_item
%type<results> property_case_item_283
%type<results> property_case_item_284
%type<results> property_declaration
%type<results> property_declaration_267
%type<results> property_declaration_267_267
%type<results> property_declaration_269
%type<results> property_declaration_270
%type<results> property_declaration_271
%type<results> property_expr
%type<results> property_expr_277
%type<results> property_expr_278
%type<results> property_expr_279
%type<results> property_expr_280
%type<results> property_expr_281
%type<results> property_expr_282
%type<results> property_formal_type
%type<results> property_identifier
%type<results> property_instance
%type<results> property_instance_261
%type<results> property_instance_261_261
%type<results> property_list_of_arguments
%type<results> property_list_of_arguments_263
%type<results> property_list_of_arguments_264
%type<results> property_list_of_arguments_265
%type<results> property_list_of_arguments_266
%type<results> property_lvar_port_direction
%type<results> property_port_item
%type<results> property_port_item_273
%type<results> property_port_item_274
%type<results> property_port_item_274_274
%type<results> property_port_item_276
%type<results> property_port_list
%type<results> property_port_list_272
%type<results> property_qualifier
%type<results> property_spec
%type<results> ps_checker_identifier
%type<results> ps_class_identifier
%type<results> ps_covergroup_identifier
%type<results> ps_identifier
%type<results> ps_or_hierarchical_array_identifier
%type<results> ps_or_hierarchical_net_identifier
%type<results> ps_or_hierarchical_property_identifier
%type<results> ps_or_hierarchical_sequence_identifier
%type<results> ps_or_hierarchical_tf_identifier
%type<results> ps_parameter_identifier
%type<results> ps_parameter_identifier_560
%type<results> ps_parameter_identifier_560_560
%type<results> ps_type_identifier
%type<results> ps_type_identifier_562
%type<results> pull_gate_instance
%type<results> pulldown_strength
%type<results> pullup_strength
%type<results> pulse_control_specparam
%type<results> pulse_control_specparam_218
%type<results> pulsestyle_declaration
%type<results> queue_dimension
%type<results> queue_dimension_224
%type<results> randcase_item
%type<results> randcase_statement
%type<results> randcase_statement_444
%type<results> random_qualifier
%type<results> randomize_call
%type<results> randomize_call_524
%type<results> randomize_call_525
%type<results> randomize_call_525_525
%type<results> randomize_call_527
%type<results> randomize_call_527_527
%type<results> randomize_call_527_527_527
%type<results> randsequence_statement
%type<results> randsequence_statement_471
%type<results> randsequence_statement_472
%type<results> range_expression
%type<results> real_number
%type<results> recovery_timing_check
%type<results> recrem_timing_check
%type<results> ref_declaration
%type<results> reference_event
%type<results> reject_limit_value
%type<results> remain_active_flag
%type<results> removal_timing_check
%type<results> repeat_range
%type<results> restrict_property_statement
%type<results> rs_case
%type<results> rs_case_483
%type<results> rs_case_item
%type<results> rs_case_item_484
%type<results> rs_code_block
%type<results> rs_code_block_480
%type<results> rs_code_block_481
%type<results> rs_if_else
%type<results> rs_if_else_482
%type<results> rs_prod
%type<results> rs_production_list
%type<results> rs_production_list_478
%type<results> rs_production_list_479
%type<results> rs_repeat
%type<results> rs_rule
%type<results> rs_rule_476
%type<results> rs_rule_476_476
%type<results> scalar_constant
%type<results> scalar_timing_check_condition
%type<results> select
%type<results> select_545
%type<results> select_545_545
%type<results> select_547
%type<results> select_condition
%type<results> select_condition_348
%type<results> select_expression
%type<results> select_expression_347
%type<results> seq_block
%type<results> seq_block_423
%type<results> seq_block_424
%type<results> seq_block_425
%type<results> seq_input_list
%type<results> sequence_abbrev
%type<results> sequence_actual_arg
%type<results> sequence_declaration
%type<results> sequence_declaration_285
%type<results> sequence_declaration_285_285
%type<results> sequence_declaration_287
%type<results> sequence_declaration_288
%type<results> sequence_expr
%type<results> sequence_expr_295
%type<results> sequence_expr_296
%type<results> sequence_expr_297
%type<results> sequence_expr_298
%type<results> sequence_expr_299
%type<results> sequence_expr_300
%type<results> sequence_formal_type
%type<results> sequence_identifier
%type<results> sequence_instance
%type<results> sequence_instance_301
%type<results> sequence_instance_301_301
%type<results> sequence_list_of_arguments
%type<results> sequence_list_of_arguments_303
%type<results> sequence_list_of_arguments_304
%type<results> sequence_list_of_arguments_305
%type<results> sequence_list_of_arguments_306
%type<results> sequence_lvar_port_direction
%type<results> sequence_match_item
%type<results> sequence_method_call
%type<results> sequence_port_item
%type<results> sequence_port_item_290
%type<results> sequence_port_item_291
%type<results> sequence_port_item_291_291
%type<results> sequence_port_item_293
%type<results> sequence_port_item_294
%type<results> sequence_port_list
%type<results> sequence_port_list_289
%type<results> sequential_body
%type<results> sequential_body_410
%type<results> sequential_body_411
%type<results> sequential_entry
%type<results> set_covergroup_expression
%type<results> setup_timing_check
%type<results> setup_timing_check_490
%type<results> setup_timing_check_490_490
%type<results> setuphold_timing_check
%type<results> setuphold_timing_check_492
%type<results> setuphold_timing_check_492_492
%type<results> setuphold_timing_check_492_492_492
%type<results> setuphold_timing_check_492_492_493
%type<results> setuphold_timing_check_492_492_493_493
%type<results> setuphold_timing_check_492_492_493_494
%type<results> setuphold_timing_check_492_492_493_494_494
%type<results> setuphold_timing_check_492_492_493_494_495
%type<results> setuphold_timing_check_492_492_493_494_495_495
%type<results> showcancelled_declaration
%type<results> signal_identifier
%type<results> signing
%type<results> simple_identifier
%type<results> simple_immediate_assert_statement
%type<results> simple_immediate_assertion_statement
%type<results> simple_immediate_assume_statement
%type<results> simple_immediate_cover_statement
%type<results> simple_path_declaration
%type<results> simple_type
%type<results> skew_timing_check
%type<results> slice_size
%type<results> solve_before_list
%type<results> solve_before_list_141
%type<results> source_text
%type<results> source_text_4
%type<results> source_text_5
%type<results> specify_block
%type<results> specify_block_485
%type<results> specify_input_terminal_descriptor
%type<results> specify_input_terminal_descriptor_489
%type<results> specify_item
%type<results> specify_output_terminal_descriptor
%type<results> specify_terminal_descriptor
%type<results> specparam_assignment
%type<results> specparam_declaration
%type<results> specparam_declaration_152
%type<results> specparam_identifier
%type<results> start_edge_offset
%type<results> state_dependent_path_declaration
%type<results> statement
%type<results> statement_429
%type<results> statement_item
%type<results> statement_or_null
%type<results> statement_or_null_428
%type<results> stream_concatenation
%type<results> stream_concatenation_513
%type<results> stream_expression
%type<results> stream_expression_514
%type<results> stream_operator
%type<results> streaming_concatenation
%type<results> streaming_concatenation_512
%type<results> strength0
%type<results> strength1
%type<results> string_literal
%type<results> struct_union
%type<results> struct_union_187
%type<results> struct_union_member
%type<results> struct_union_member_185
%type<results> struct_union_member_186
%type<results> structure_pattern_key
%type<results> subroutine_call
%type<results> subroutine_call_517
%type<results> subroutine_call_statement
%type<results> system_tf_call
%type<results> system_tf_call_516
%type<results> system_tf_identifier
%type<results> system_timing_check
%type<results> t_path_delay_expression
%type<results> t01_path_delay_expression
%type<results> t0x_path_delay_expression
%type<results> t0z_path_delay_expression
%type<results> t10_path_delay_expression
%type<results> t1x_path_delay_expression
%type<results> t1z_path_delay_expression
%type<results> tagged_union_expression
%type<results> task_body_declaration
%type<results> task_body_declaration_234
%type<results> task_body_declaration_235
%type<results> task_body_declaration_236
%type<results> task_body_declaration_237
%type<results> task_body_declaration_238
%type<results> task_declaration
%type<results> task_identifier
%type<results> task_prototype
%type<results> terminal_identifier
%type<results> tf_call
%type<results> tf_call_515
%type<results> tf_identifier
%type<results> tf_item_declaration
%type<results> tf_port_declaration
%type<results> tf_port_declaration_244
%type<results> tf_port_direction
%type<results> tf_port_item
%type<results> tf_port_item_240
%type<results> tf_port_item_241
%type<results> tf_port_item_242
%type<results> tf_port_item_242_242
%type<results> tf_port_list
%type<results> tf_port_list_239
%type<results> tfall_path_delay_expression
%type<results> threshold
%type<results> time_literal
%type<results> time_unit
%type<results> timecheck_condition
%type<results> timeskew_timing_check
%type<results> timeskew_timing_check_501
%type<results> timeskew_timing_check_501_501
%type<results> timeskew_timing_check_501_501_501
%type<results> timeskew_timing_check_501_501_502
%type<results> timeskew_timing_check_501_501_502_502
%type<results> timestamp_condition
%type<results> timeunits_declaration
%type<results> timeunits_declaration_59
%type<results> timing_check_condition
%type<results> timing_check_event
%type<results> timing_check_event_506
%type<results> timing_check_event_507
%type<results> timing_check_event_control
%type<results> timing_check_limit
%type<results> topmodule_identifier
%type<results> trans_item
%type<results> trans_list
%type<results> trans_list_340
%type<results> trans_range_list
%type<results> trans_set
%type<results> trans_set_341
%type<results> trise_path_delay_expression
%type<results> tx0_path_delay_expression
%type<results> tx1_path_delay_expression
%type<results> txz_path_delay_expression
%type<results> type_assignment
%type<results> type_assignment_217
%type<results> type_declaration
%type<results> type_declaration_165
%type<results> type_declaration_166
%type<results> type_identifier
%type<results> type_reference
%type<results> tz_path_delay_expression
%type<results> tz0_path_delay_expression
%type<results> tz1_path_delay_expression
%type<results> tzx_path_delay_expression
%type<results> udp_ansi_declaration
%type<results> udp_ansi_declaration_398
%type<results> udp_body
%type<results> udp_declaration
%type<results> udp_declaration_399
%type<results> udp_declaration_400
%type<results> udp_declaration_401
%type<results> udp_declaration_402
%type<results> udp_declaration_port_list
%type<results> udp_declaration_port_list_404
%type<results> udp_identifier
%type<results> udp_initial_statement
%type<results> udp_input_declaration
%type<results> udp_input_declaration_407
%type<results> udp_instance
%type<results> udp_instance_416
%type<results> udp_instantiation
%type<results> udp_instantiation_415
%type<results> udp_nonansi_declaration
%type<results> udp_nonansi_declaration_397
%type<results> udp_output_declaration
%type<results> udp_output_declaration_405
%type<results> udp_output_declaration_406
%type<results> udp_port_declaration
%type<results> udp_port_list
%type<results> udp_port_list_403
%type<results> udp_reg_declaration
%type<results> udp_reg_declaration_408
%type<results> unary_module_path_operator
%type<results> unary_operator
%type<results> unbased_unsized_literal
%type<results> unique_priority
%type<results> uniqueness_constraint
%type<results> unpacked_dimension
%type<results> unsigned_number
%type<results> unsized_dimension
%type<results> use_clause
%type<results> use_clause_101
%type<results> use_clause_102
%type<results> use_clause_103
%type<results> value_range
%type<results> var_data_type
%type<results> variable_assignment
%type<results> variable_decl_assignment
%type<results> variable_decl_assignment_219
%type<results> variable_decl_assignment_220
%type<results> variable_decl_assignment_221
%type<results> variable_decl_assignment_222
%type<results> variable_dimension
%type<results> variable_identifier
%type<results> variable_identifier_list
%type<results> variable_identifier_list_431
%type<results> variable_lvalue
%type<results> variable_lvalue_555
%type<results> variable_lvalue_556
%type<results> variable_port_header
%type<results> variable_port_type
%type<results> wait_statement
%type<results> wait_statement_434
%type<results> weight_specification
%type<results> width_timing_check
%type<results> with_covergroup_expression
%type<results> z_or_x
%type<results> zero_or_one

%%

text: library_text | source_text ;

action_block:
statement_or_null
| action_block_422 ELSE_ statement_or_null { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

action_block_422:
%empty { C($$); }
| statement
;

always_construct:
always_keyword statement { $$ = $1; P($$, $2); }
;

always_keyword:
ALWAYS_ { C($$); T($$, @1, zero, zero); }
| ALWAYS_COMB_ { C($$); T($$, @1, zero, zero); }
| ALWAYS_LATCH_ { C($$); T($$, @1, zero, zero); }
| ALWAYS_FF_ { C($$); T($$, @1, zero, zero); }
;

anonymous_program:
PROGRAM_ ';' anonymous_program_151 ENDPROGRAM_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

anonymous_program_151:
%empty { C($$); }
| anonymous_program_151 anonymous_program_item { $$ = $1; P($$, $2); }
;

anonymous_program_item:
task_declaration
| function_declaration
| class_declaration
| covergroup_declaration
| class_constructor_declaration
| ';' { C($$); T($$, @1, zero, zero); }
;

ansi_port_declaration:
ansi_port_declaration_76 port_identifier ansi_port_declaration_77 ansi_port_declaration_78 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| ansi_port_declaration_79 port_identifier ansi_port_declaration_80 ansi_port_declaration_78 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| net_port_header_74 '.' port_identifier '(' ansi_port_declaration_81 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

ansi_port_declaration_76:
%empty /* { C($$); } -- ignore */
| net_port_header
| interface_port_header
;

ansi_port_declaration_77:
%empty { C($$); }
| ansi_port_declaration_77 unpacked_dimension { $$ = $1; P($$, $2); }
;

ansi_port_declaration_78:
%empty { C($$); }
| '=' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

ansi_port_declaration_79:
%empty /* { C($$); } -- ignore */
| variable_port_header
;

ansi_port_declaration_80:
%empty { C($$); }
| ansi_port_declaration_80 variable_dimension { $$ = $1; P($$, $2); }
;

ansi_port_declaration_81:
%empty { C($$); }
| expression
;

array_manipulation_call:
array_method_name array_manipulation_call_522 class_declaration_44_44 array_manipulation_call_523 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
;

array_manipulation_call_522:
%empty { C($$); }
| array_manipulation_call_522 attribute_instance { $$ = $1; P($$, $2); }
;

array_manipulation_call_523:
%empty { C($$); }
| WITH_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

array_method_name:
method_identifier
| UNIQUE_ { C($$); T($$, @1, zero, zero); }
| AND_ { C($$); T($$, @1, zero, zero); }
| OR_ { C($$); T($$, @1, zero, zero); }
| XOR_ { C($$); T($$, @1, zero, zero); }
;

array_pattern_key:
constant_expression
| assignment_pattern_key
;

array_range_expression:
expression
| expression ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression PLUSC expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression MC expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

assert_property_statement:
ASSERT_ PROPERTY_ '(' property_spec ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

assertion_item:
concurrent_assertion_item
| deferred_immediate_assertion_item
;

assertion_item_declaration:
property_declaration
| sequence_declaration
| let_declaration
;

assertion_variable_declaration:
var_data_type list_of_variable_decl_assignments ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

assignment_operator:
'=' { C($$); T($$, @1, zero, zero); }
| PLUSE { C($$); T($$, @1, zero, zero); }
| ME { C($$); T($$, @1, zero, zero); }
| SE { C($$); T($$, @1, zero, zero); }
| VE { C($$); T($$, @1, zero, zero); }
| PE { C($$); T($$, @1, zero, zero); }
| AMPE { C($$); T($$, @1, zero, zero); }
| PIPEE { C($$); T($$, @1, zero, zero); }
| HE { C($$); T($$, @1, zero, zero); }
| LLE { C($$); T($$, @1, zero, zero); }
| GGE { C($$); T($$, @1, zero, zero); }
| LLLE { C($$); T($$, @1, zero, zero); }
| GGGE { C($$); T($$, @1, zero, zero); }
;

assignment_pattern:
APOSOCB expression assignment_pattern_449 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| APOSOCB structure_pattern_key ':' expression assignment_pattern_450 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| APOSOCB array_pattern_key ':' expression assignment_pattern_451 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| APOSOCB constant_expression '{' expression assignment_pattern_452 '}' '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); }
;

assignment_pattern_449:
%empty { C($$); }
| assignment_pattern_449 ',' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

assignment_pattern_450:
%empty { C($$); }
| assignment_pattern_450 ',' structure_pattern_key ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

assignment_pattern_451:
%empty { C($$); }
| assignment_pattern_451 ',' array_pattern_key ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

assignment_pattern_452:
%empty { C($$); }
| assignment_pattern_452 ',' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

assignment_pattern_expression:
assignment_pattern_expression_453 assignment_pattern { $$ = $1; P($$, $2); }
;

assignment_pattern_expression_453:
%empty { C($$); }
| assignment_pattern_expression_type
;

assignment_pattern_expression_type:
ps_type_identifier
| ps_parameter_identifier
| integer_atom_type
| type_reference
;

assignment_pattern_key:
simple_type
| DEFAULT_ { C($$); T($$, @1, zero, zero); }
;

assignment_pattern_net_lvalue:
APOSOCB net_lvalue assignment_pattern_net_lvalue_454 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

assignment_pattern_net_lvalue_454:
%empty { C($$); }
| assignment_pattern_net_lvalue_454 ',' net_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

assignment_pattern_variable_lvalue:
APOSOCB variable_lvalue assignment_pattern_variable_lvalue_455 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

assignment_pattern_variable_lvalue_455:
%empty { C($$); }
| assignment_pattern_variable_lvalue_455 ',' variable_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

associative_dimension:
'[' data_type ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| '[' '*' ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

assume_property_statement:
ASSUME_ PROPERTY_ '(' property_spec ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

attr_name:
identifier
;

attr_spec:
attr_name ansi_port_declaration_78 { $$ = $1; P($$, $2); }
;

attribute_instance:
OPS attr_spec attribute_instance_557 SCP { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

attribute_instance_557:
%empty { C($$); }
| attribute_instance_557 ',' attr_spec { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

bin_identifier:
identifier
;

binary_module_path_operator:
EE { C($$); T($$, @1, zero, zero); }
| BANGE { C($$); T($$, @1, zero, zero); }
| AMPAMP { C($$); T($$, @1, zero, zero); }
| PIPEPIPE { C($$); T($$, @1, zero, zero); }
| '&' { C($$); T($$, @1, zero, zero); }
| '|' { C($$); T($$, @1, zero, zero); }
| '^' { C($$); T($$, @1, zero, zero); }
| HT { C($$); T($$, @1, zero, zero); }
| TH { C($$); T($$, @1, zero, zero); }
;

binary_operator:
'+' { C($$); T($$, @1, zero, zero); }
| '-' { C($$); T($$, @1, zero, zero); }
| '*' { C($$); T($$, @1, zero, zero); }
| '/' { C($$); T($$, @1, zero, zero); }
| '%' { C($$); T($$, @1, zero, zero); }
| EE { C($$); T($$, @1, zero, zero); }
| BANGE { C($$); T($$, @1, zero, zero); }
| EEE { C($$); T($$, @1, zero, zero); }
| BANGEE { C($$); T($$, @1, zero, zero); }
| EEQ { C($$); T($$, @1, zero, zero); }
| BANGEQ { C($$); T($$, @1, zero, zero); }
| AMPAMP { C($$); T($$, @1, zero, zero); }
| PIPEPIPE { C($$); T($$, @1, zero, zero); }
| SS { C($$); T($$, @1, zero, zero); }
| '<' { C($$); T($$, @1, zero, zero); }
| LE { C($$); T($$, @1, zero, zero); }
| '>' { C($$); T($$, @1, zero, zero); }
| GE { C($$); T($$, @1, zero, zero); }
| '&' { C($$); T($$, @1, zero, zero); }
| '|' { C($$); T($$, @1, zero, zero); }
| '^' { C($$); T($$, @1, zero, zero); }
| HT { C($$); T($$, @1, zero, zero); }
| TH { C($$); T($$, @1, zero, zero); }
| GG { C($$); T($$, @1, zero, zero); }
| LL { C($$); T($$, @1, zero, zero); }
| GGG { C($$); T($$, @1, zero, zero); }
| LLL { C($$); T($$, @1, zero, zero); }
| MG { C($$); T($$, @1, zero, zero); }
| LMG { C($$); T($$, @1, zero, zero); }
;

bind_directive:
BIND_ bind_target_scope bind_directive_92 bind_instantiation ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| BIND_ bind_target_instance bind_instantiation ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

bind_directive_92:
%empty { C($$); }
| ':' bind_target_instance_list { C($$); T($$, @1, zero, zero); P($$, $2); }
;

bind_instantiation:
program_instantiation
| module_instantiation
| interface_instantiation
| checker_instantiation
;

bind_target_instance:
hierarchical_identifier constant_bit_select { $$ = $1; P($$, $2); }
;

bind_target_instance_list:
bind_target_instance bind_target_instance_list_93 { $$ = $1; P($$, $2); }
;

bind_target_instance_list_93:
%empty { C($$); }
| bind_target_instance_list_93 ',' bind_target_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

bind_target_scope:
identifier
;

bins_expression:
dotted_identifier
;

bins_expression_349:
%empty /* { C($$); } -- ignore */
| '.' bin_identifier /* { C($$); T($$, @1, zero, zero); P($$, $2); } -- ignore */
;

bins_keyword:
BINS_ { C($$); T($$, @1, zero, zero); }
| ILLEGAL_BINS_ { C($$); T($$, @1, zero, zero); }
| IGNORE_BINS_ { C($$); T($$, @1, zero, zero); }
;

bins_or_empty:
bins_or_empty_330
| ';' { C($$); T($$, @1, zero, zero); }
;

bins_or_empty_330:
%empty { C($$); }
| bins_or_empty_330 bins_or_empty_330_330 bins_or_empty_330_331 { $$ = $1; P($$, $2); P($$, $3); }
;

bins_or_empty_330_330:
%empty { C($$); }
| bins_or_empty_330_330 attribute_instance { $$ = $1; P($$, $2); }
;

bins_or_empty_330_331:
%empty { C($$); }
| bins_or_empty_330_331 bins_or_options ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

bins_or_options:
coverage_option
| bins_or_options_333 bins_keyword bin_identifier bins_or_options_334 '=' '{' covergroup_range_list '}' bins_or_options_336 cover_point_329 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); }
| bins_or_options_333 bins_keyword bin_identifier bins_or_options_334 '=' cover_point_identifier bins_or_options_336 cover_point_329 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); P($$, $8); }
| bins_or_options_333 bins_keyword bin_identifier bins_or_options_334 '=' set_covergroup_expression cover_point_329 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); }
| bins_or_options_333 bins_keyword bin_identifier bins_or_options_337 '=' trans_list cover_point_329 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); }
| bins_keyword bin_identifier bins_or_options_338 '=' DEFAULT_ cover_point_329 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); T($$, @5, zero, zero); P($$, $6); }
| bins_keyword bin_identifier '=' DEFAULT_ SEQUENCE_ cover_point_329 { $$ = $1; P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); T($$, @5, zero, zero); P($$, $6); }
;

bins_or_options_333:
%empty /* { C($$); } -- ignore */
| WILDCARD_ { C($$); T($$, @1, zero, zero); }
;

bins_or_options_334:
%empty { C($$); }
| '[' bins_or_options_334_334 ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

bins_or_options_334_334:
%empty /* { C($$); } -- ignore */
| covergroup_expression
;

bins_or_options_336:
%empty { C($$); }
| WITH_ '(' with_covergroup_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_or_options_337:
%empty /* { C($$); } -- ignore */
| '[' ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

bins_or_options_338:
%empty /* { C($$); } -- ignore */
| bins_or_options_338_338
;

bins_or_options_338_338:
%empty /* { C($$); } -- ignore */
| bins_or_options_334_334
;

bins_selection:
bins_keyword bin_identifier '=' select_expression cover_point_329 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); }
;

bins_selection_or_option:
bins_selection_or_option_345 coverage_option { $$ = $1; P($$, $2); }
| bins_selection_or_option_346 bins_selection { $$ = $1; P($$, $2); }
;

bins_selection_or_option_345:
%empty { C($$); }
| bins_selection_or_option_345 attribute_instance { $$ = $1; P($$, $2); }
;

bins_selection_or_option_346:
%empty { C($$); }
| bins_selection_or_option_346 attribute_instance { $$ = $1; P($$, $2); }
;

bit_select:
bit_select_544
;

bit_select_544:
%empty { C($$); }
| bit_select_544 '[' expression ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

block_event_expression:
block_event_expression OR_ block_event_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| BEGIN_ hierarchical_btf_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| END_ hierarchical_btf_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

block_identifier:
identifier
;

block_item_declaration:
block_item_declaration_245 data_declaration { $$ = $1; P($$, $2); }
| block_item_declaration_246 local_parameter_declaration ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| block_item_declaration_247 parameter_declaration ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| block_item_declaration_248 overload_declaration { $$ = $1; P($$, $2); }
| block_item_declaration_249 let_declaration { $$ = $1; P($$, $2); }
;

block_item_declaration_245:
%empty { C($$); }
| block_item_declaration_245 attribute_instance { $$ = $1; P($$, $2); }
;

block_item_declaration_246:
%empty { C($$); }
| block_item_declaration_246 attribute_instance { $$ = $1; P($$, $2); }
;

block_item_declaration_247:
%empty { C($$); }
| block_item_declaration_247 attribute_instance { $$ = $1; P($$, $2); }
;

block_item_declaration_248:
%empty { C($$); }
| block_item_declaration_248 attribute_instance { $$ = $1; P($$, $2); }
;

block_item_declaration_249:
%empty { C($$); }
| block_item_declaration_249 attribute_instance { $$ = $1; P($$, $2); }
;

blocking_assignment:
variable_lvalue '=' delay_or_event_control expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
| nonrange_variable_lvalue '=' dynamic_array_new { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| blocking_assignment_420 hierarchical_variable_identifier select BANGE class_new { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| operator_assignment
;

blocking_assignment_420:
%empty { C($$); }
| implicit_class_handle '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
| package_scope
;

boolean_abbrev:
consecutive_repetition
| non_consecutive_repetition
| goto_repetition
;

built_in_method_call:
array_manipulation_call
| randomize_call
;

c_identifier:
CID_ { C($$); T($$, @1, zero, zero); }
;

case_expression:
expression
;

case_generate_construct:
CASE_ '(' constant_expression ')' case_generate_construct_392 ENDCASE_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

case_generate_construct_392:
case_generate_item
| case_generate_construct_392 case_generate_item { $$ = $1; P($$, $2); }
;

case_generate_item:
constant_expression case_generate_item_393 ':' generate_block { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| DEFAULT_ property_case_item_284 generate_block { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

case_generate_item_393:
%empty { C($$); }
| case_generate_item_393 ',' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

case_inside_item:
open_range_list ':' statement_or_null { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| DEFAULT_ property_case_item_284 statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

case_item:
case_item_expression case_item_442 ':' statement_or_null { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| DEFAULT_ property_case_item_284 statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

case_item_442:
%empty { C($$); }
| case_item_442 ',' case_item_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

case_item_expression:
expression
;

case_keyword:
CASE_ /* { C($$); T($$, @1, zero, zero); } -- ignore */
| CASEZ_ { C($$); T($$, @1, zero, zero); }
| CASEX_ { C($$); T($$, @1, zero, zero); }
;

case_pattern_item:
pattern case_pattern_item_443 ':' statement_or_null { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| DEFAULT_ property_case_item_284 statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

case_pattern_item_443:
%empty { C($$); }
| AMPAMPAMP expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

case_statement:
conditional_statement_435 case_keyword '(' case_expression ')' case_statement_439 ENDCASE_ { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
| conditional_statement_435 case_keyword '(' case_expression ')' MATCHES_ case_statement_440 ENDCASE_ { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); }
| conditional_statement_435 CASE_ '(' case_expression ')' INSIDE_ case_statement_441 ENDCASE_ { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); }
;

case_statement_439:
case_item
| case_statement_439 case_item { $$ = $1; P($$, $2); }
;

case_statement_440:
case_pattern_item
| case_statement_440 case_pattern_item { $$ = $1; P($$, $2); }
;

case_statement_441:
case_inside_item
| case_statement_441 case_inside_item { $$ = $1; P($$, $2); }
;

cast:
casting_type '\'' '(' expression ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

casting_type:
simple_type
| constant_primary
| signing
| STRING_ { C($$); T($$, @1, zero, zero); }
| CONST_ { C($$); T($$, @1, zero, zero); }
;

cell_clause:
CELL_ dotted_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

cell_identifier:
identifier /* ignore */
;

charge_strength:
'(' SMALL_ ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
| '(' MEDIUM_ ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
| '(' LARGE_ ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

checker_declaration:
CHECKER_ checker_identifier checker_declaration_38 ';' checker_declaration_40 ENDCHECKER_ checker_declaration_42 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); }
;

checker_declaration_38:
%empty { C($$); }
| '(' checker_declaration_38_38 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

checker_declaration_38_38:
%empty { C($$); }
| checker_port_list
;

checker_declaration_40:
%empty { C($$); }
| checker_declaration_40 checker_declaration_40_40 checker_or_generate_item { $$ = $1; P($$, $2); P($$, $3); }
;

checker_declaration_40_40:
%empty { C($$); }
| checker_declaration_40_40 attribute_instance { $$ = $1; P($$, $2); }
;

checker_declaration_42:
%empty { C($$); }
| ':' checker_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

checker_generate_item:
loop_generate_construct
| conditional_generate_construct
| generate_region
| elaboration_system_task
;

checker_identifier:
identifier
;

checker_instantiation:
ps_checker_identifier name_of_instance '(' checker_instantiation_382 ')' ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); }
;

checker_instantiation_382:
%empty { C($$); }
| list_of_checker_port_connections
;

checker_or_generate_item:
checker_or_generate_item_declaration
| initial_construct
| always_construct
| final_construct
| assertion_item
| continuous_assign
| checker_generate_item
;

checker_or_generate_item_declaration:
checker_or_generate_item_declaration_117 data_declaration { $$ = $1; P($$, $2); }
| function_declaration
| checker_declaration
| assertion_item_declaration
| covergroup_declaration
| overload_declaration
| genvar_declaration
| clocking_declaration
| DEFAULT_ CLOCKING_ clocking_identifier ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| DEFAULT_ DISABLE_ IFF_ expression_or_dist ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| ';' { C($$); T($$, @1, zero, zero); }
;

checker_or_generate_item_declaration_117:
%empty { C($$); }
| RAND_ { C($$); T($$, @1, zero, zero); }
;

checker_port_direction:
INPUT_ { C($$); T($$, @1, zero, zero); }
| OUTPUT_ { C($$); T($$, @1, zero, zero); }
;

checker_port_item:
checker_port_item_113 checker_port_item_114 property_formal_type formal_port_identifier checker_port_item_115 checker_port_item_116 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

checker_port_item_113:
%empty { C($$); }
| checker_port_item_113 attribute_instance { $$ = $1; P($$, $2); }
;

checker_port_item_114:
%empty { C($$); }
| checker_port_direction
;

checker_port_item_115:
%empty { C($$); }
| checker_port_item_115 variable_dimension { $$ = $1; P($$, $2); }
;

checker_port_item_116:
%empty { C($$); }
| '=' property_actual_arg { C($$); T($$, @1, zero, zero); P($$, $2); }
;

checker_port_list:
checker_port_item checker_port_list_112 { $$ = $1; P($$, $2); }
;

checker_port_list_112:
%empty { C($$); }
| checker_port_list_112 ',' checker_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

class_constraint:
constraint_prototype
| constraint_declaration
;

class_constructor_declaration:
FUNCTION_ class_constructor_declaration_134 NEW_ class_constructor_prototype_131 ';' class_constructor_declaration_135 class_constructor_declaration_136 class_constructor_declaration_137 ENDFUNCTION_ class_constructor_declaration_138 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); P($$, $8); T($$, @9, zero, zero); P($$, $10); }
;

class_constructor_declaration_134:
%empty { C($$); }
| class_scope
;

class_constructor_declaration_135:
%empty { C($$); }
| class_constructor_declaration_135 block_item_declaration { $$ = $1; P($$, $2); }
;

class_constructor_declaration_136:
%empty { C($$); }
| SUPER_ '.' NEW_ class_declaration_44_44 ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

class_constructor_declaration_137:
%empty { C($$); }
| class_constructor_declaration_137 function_statement_or_null { $$ = $1; P($$, $2); }
;

class_constructor_declaration_138:
%empty { C($$); }
| ':' NEW_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

class_constructor_prototype:
FUNCTION_ NEW_ class_constructor_prototype_131 ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

class_constructor_prototype_131:
%empty { C($$); }
| '(' class_constructor_prototype_131_131 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

class_constructor_prototype_131_131:
%empty { C($$); }
| tf_port_list
;

class_declaration:
class_declaration_43 CLASS_ module_nonansi_header_9 class_identifier module_nonansi_header_11 class_declaration_44 class_declaration_46 ';' class_declaration_48 ENDCLASS_ class_declaration_49 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
;

class_declaration_43:
%empty { C($$); }
| VIRTUAL_ { C($$); T($$, @1, zero, zero); }
;

class_declaration_44:
%empty { C($$); }
| EXTENDS_ class_type class_declaration_44_44 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

class_declaration_44_44:
%empty { C($$); }
| '(' list_of_arguments ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

class_declaration_46:
%empty { C($$); }
| IMPLEMENTS_ interface_class_type class_declaration_46_46 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

class_declaration_46_46:
%empty { C($$); }
| class_declaration_46_46 ',' interface_class_type { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

class_declaration_48:
%empty { C($$); }
| class_declaration_48 class_item { $$ = $1; P($$, $2); }
;

class_declaration_49:
%empty { C($$); }
| ':' class_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

class_identifier:
identifier
;

class_item:
class_item_118 class_property { $$ = $1; P($$, $2); }
| class_item_119 class_method { $$ = $1; P($$, $2); }
| class_item_120 class_constraint { $$ = $1; P($$, $2); }
| class_item_121 class_declaration { $$ = $1; P($$, $2); }
| class_item_122 covergroup_declaration { $$ = $1; P($$, $2); }
| local_parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| ';' { C($$); T($$, @1, zero, zero); }
;

class_item_118:
%empty { C($$); }
| class_item_118 attribute_instance { $$ = $1; P($$, $2); }
;

class_item_119:
%empty { C($$); }
| class_item_119 attribute_instance { $$ = $1; P($$, $2); }
;

class_item_120:
%empty { C($$); }
| class_item_120 attribute_instance { $$ = $1; P($$, $2); }
;

class_item_121:
%empty { C($$); }
| class_item_121 attribute_instance { $$ = $1; P($$, $2); }
;

class_item_122:
%empty { C($$); }
| class_item_122 attribute_instance { $$ = $1; P($$, $2); }
;

class_item_qualifier:
STATIC_ { C($$); T($$, @1, zero, zero); }
| PROTECTED_ { C($$); T($$, @1, zero, zero); }
| LOCAL_ { C($$); T($$, @1, zero, zero); }
;

class_method:
class_method_125 task_declaration { $$ = $1; P($$, $2); }
| class_method_126 function_declaration { $$ = $1; P($$, $2); }
| PURE_ VIRTUAL_ class_method_127 method_prototype ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| EXTERN_ class_method_128 method_prototype ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| class_method_129 class_constructor_declaration { $$ = $1; P($$, $2); }
| EXTERN_ class_method_130 class_constructor_prototype { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

class_method_125:
%empty { C($$); }
| class_method_125 method_qualifier { $$ = $1; P($$, $2); }
;

class_method_126:
%empty { C($$); }
| class_method_126 method_qualifier { $$ = $1; P($$, $2); }
;

class_method_127:
%empty { C($$); }
| class_method_127 class_item_qualifier { $$ = $1; P($$, $2); }
;

class_method_128:
%empty { C($$); }
| class_method_128 method_qualifier { $$ = $1; P($$, $2); }
;

class_method_129:
%empty /* { C($$); } -- ignore */
| class_method_129 method_qualifier { $$ = $1; P($$, $2); }
;

class_method_130:
%empty /* { C($$); } -- ignore */
| class_method_130 method_qualifier { $$ = $1; P($$, $2); }
;

class_new:
class_constructor_declaration_134 NEW_ class_declaration_44_44 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| NEW_ expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

class_property:
class_property_123 data_declaration { $$ = $1; P($$, $2); }
| CONST_ class_property_124 data_type const_identifier ansi_port_declaration_78 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

class_property_123:
%empty { C($$); }
| class_property_123 property_qualifier { $$ = $1; P($$, $2); }
;

class_property_124:
%empty { C($$); }
| class_property_124 class_item_qualifier { $$ = $1; P($$, $2); }
;

class_qualifier:
class_qualifier_543 constraint_primary_142 { $$ = $1; P($$, $2); }
;

class_qualifier_543:
%empty /* { C($$); } -- ignore */
| localCC { C($$); T($$, @1, zero, zero); }
;

class_scope:
class_type CC { $$ = $1; T($$, @2, zero, zero); }
;

class_type:
ps_class_identifier interface_class_type_50 class_type_183 { $$ = $1; P($$, $2); P($$, $3); }
;

class_type_183:
%empty { C($$); }
| class_type_183 CC class_identifier interface_class_type_50 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

class_variable_identifier:
variable_identifier
;

clocking_decl_assign:
signal_identifier list_of_tf_variable_identifiers_203 { $$ = $1; P($$, $2); }
;

clocking_declaration:
clocking_declaration_463 CLOCKING_ clocking_declaration_464 clocking_event ';' clocking_declaration_465 ENDCLOCKING_ clocking_declaration_466 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
| GLOBAL_ CLOCKING_ clocking_declaration_464 clocking_event ';' ENDCLOCKING_ clocking_declaration_466 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); }
;

clocking_declaration_463:
%empty { C($$); }
| DEFAULT_ /* { C($$); T($$, @1, zero, zero); } -- ignore */
;

clocking_declaration_464:
%empty { C($$); }
| clocking_identifier
;

clocking_declaration_465:
%empty { C($$); }
| clocking_declaration_465 clocking_item { $$ = $1; P($$, $2); }
;

clocking_declaration_466:
%empty { C($$); }
| ':' clocking_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

clocking_direction:
INPUT_ clocking_direction_468 { C($$); T($$, @1, zero, zero); P($$, $2); }
| OUTPUT_ clocking_direction_468 { C($$); T($$, @1, zero, zero); P($$, $2); }
| INPUT_ clocking_direction_468 OUTPUT_ clocking_direction_468 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| INOUT_ { C($$); T($$, @1, zero, zero); }
;

clocking_direction_468:
%empty { C($$); }
| clocking_skew
;

clocking_drive:
clockvar_expression LE clocking_drive_470 expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

clocking_drive_470:
%empty { C($$); }
| cycle_delay
;

clocking_event:
'@' identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| '@' '(' event_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

clocking_identifier:
identifier
;

clocking_item:
DEFAULT_ default_skew ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| clocking_direction list_of_clocking_decl_assign ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| clocking_item_467 assertion_item_declaration { $$ = $1; P($$, $2); }
;

clocking_item_467:
%empty { C($$); }
| clocking_item_467 attribute_instance { $$ = $1; P($$, $2); }
;

clocking_skew:
edge_identifier net_declaration_160 { $$ = $1; P($$, $2); }
| delay_control
;

clockvar:
hierarchical_identifier
;

clockvar_expression:
clockvar select { $$ = $1; P($$, $2); }
;

cmos_switch_instance:
cmos_switch_instance_364 '(' output_terminal ',' input_terminal ',' ncontrol_terminal ',' pcontrol_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); T($$, @10, zero, zero); }
;

cmos_switch_instance_364:
%empty { C($$); }
| name_of_instance
;

cmos_switchtype:
CMOS_ { C($$); T($$, @1, zero, zero); }
| RCMOS_ { C($$); T($$, @1, zero, zero); }
;

combinational_body:
TABLE_ combinational_body_409 ENDTABLE_ /* { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); } -- ignore */
;

combinational_body_409:
combinational_entry /* ignore */
| combinational_body_409 combinational_entry /* { $$ = $1; P($$, $2); } -- ignore */
;

combinational_entry:
level_input_list ':' output_symbol ';' /* { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); } -- ignore */
;

concatenation:
'{' expression concatenation_509 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

concatenation_509:
%empty { C($$); }
| concatenation_509 ',' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

concurrent_assertion_item:
concurrent_assertion_item_258 concurrent_assertion_statement { $$ = $1; P($$, $2); }
| checker_instantiation
;

concurrent_assertion_item_258:
%empty { C($$); }
| block_identifier ':' { $$ = $1; T($$, @2, zero, zero); }
;

concurrent_assertion_statement:
assert_property_statement
| assume_property_statement
| cover_property_statement
| cover_sequence_statement
| restrict_property_statement
;

cond_pattern:
expression MATCHES_ pattern { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

cond_predicate:
expression_or_cond_pattern cond_predicate_438 { $$ = $1; P($$, $2); }
;

cond_predicate_438:
%empty { C($$); }
| cond_predicate_438 AMPAMPAMP expression_or_cond_pattern { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

conditional_expression:
cond_predicate '?' conditional_expression_532 expression ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

conditional_expression_532:
%empty { C($$); }
| conditional_expression_532 attribute_instance { $$ = $1; P($$, $2); }
;

conditional_generate_construct:
if_generate_construct
| case_generate_construct
;

conditional_statement:
conditional_statement_435 IF_ '(' cond_predicate ')' statement_or_null conditional_statement_436 conditional_statement_437 { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); P($$, $8); }
;

conditional_statement_435:
%empty { C($$); }
| unique_priority
;

conditional_statement_436:
%empty { C($$); }
| conditional_statement_436 ELSE_ IF_ '(' cond_predicate ')' statement_or_null { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); }
;

conditional_statement_437:
%empty { C($$); }
| ELSE_ statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); }
;

config_declaration:
CONFIG_ config_identifier ';' config_declaration_94 design_statement config_declaration_95 ENDCONFIG_ config_declaration_96 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
;

config_declaration_94:
%empty { C($$); }
| config_declaration_94 local_parameter_declaration ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

config_declaration_95:
%empty { C($$); }
| config_declaration_95 config_rule_statement { $$ = $1; P($$, $2); }
;

config_declaration_96:
%empty { C($$); }
| ':' config_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

config_identifier:
identifier
;

config_rule_statement:
default_clause liblist_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| inst_clause liblist_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| inst_clause use_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| cell_clause liblist_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| cell_clause use_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

consecutive_repetition:
OSBS const_or_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| OSBSCSB { C($$); T($$, @1, zero, zero); }
| OSBPLUSCSB { C($$); T($$, @1, zero, zero); }
;

const_identifier:
identifier
;

const_or_range_expression:
constant_expression
| cycle_delay_const_range_expression
;

constant_assignment_pattern_expression:
assignment_pattern_expression
;

constant_bit_select:
constant_bit_select_550
;

constant_bit_select_550:
%empty { C($$); }
| constant_bit_select_550 '[' constant_expression ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

constant_cast:
casting_type '\'' '(' constant_expression ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

constant_concatenation:
'{' constant_expression constant_concatenation_510 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

constant_concatenation_510:
%empty { C($$); }
| constant_concatenation_510 ',' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

constant_expression:
constant_primary
| unary_operator constant_expression_533 constant_primary { $$ = $1; P($$, $2); P($$, $3); }
| constant_expression binary_operator constant_expression_534 constant_expression { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| constant_expression '?' constant_expression_535 constant_expression ':' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

constant_expression_533:
%empty { C($$); }
| constant_expression_533 attribute_instance { $$ = $1; P($$, $2); }
;

constant_expression_534:
%empty { C($$); }
| constant_expression_534 attribute_instance { $$ = $1; P($$, $2); }
;

constant_expression_535:
%empty { C($$); }
| constant_expression_535 attribute_instance { $$ = $1; P($$, $2); }
;

constant_function_call:
function_subroutine_call
;

constant_indexed_range:
constant_expression PLUSC constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| constant_expression MC constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

constant_let_expression:
let_expression
;

constant_mintypmax_expression:
constant_expression
| constant_expression ':' constant_expression ':' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

constant_multiple_concatenation:
'{' constant_expression constant_concatenation '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

constant_param_expression:
constant_mintypmax_expression
| data_type
| '$' { C($$); T($$, @1, zero, zero); }
;

constant_part_select_range:
constant_range
| constant_indexed_range
;

constant_primary:
primary_literal
| ps_parameter_identifier constant_select { $$ = $1; P($$, $2); }
| specparam_identifier specify_input_terminal_descriptor_489 { $$ = $1; P($$, $2); }
| genvar_identifier
| formal_port_identifier constant_select { $$ = $1; P($$, $2); }
| net_type_declaration_167_167 enum_identifier { $$ = $1; P($$, $2); }
| constant_concatenation specify_input_terminal_descriptor_489 { $$ = $1; P($$, $2); }
| constant_multiple_concatenation specify_input_terminal_descriptor_489 { $$ = $1; P($$, $2); }
| constant_function_call
| constant_let_expression
| '(' constant_mintypmax_expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| constant_cast
| constant_assignment_pattern_expression
| type_reference
;

constant_range:
constant_expression ':' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

constant_range_expression:
constant_expression
| constant_part_select_range
;

constant_select:
constant_select_551 constant_bit_select constant_select_553 { $$ = $1; P($$, $2); P($$, $3); }
;

constant_select_551:
%empty { C($$); }
| constant_select_551_551 '.' member_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

constant_select_551_551:
%empty { C($$); }
| constant_select_551_551 '.' member_identifier constant_bit_select { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

constant_select_553:
%empty { C($$); }
| '[' constant_part_select_range ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

constraint_block:
'{' constraint_block_140 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

constraint_block_140:
%empty { C($$); }
| constraint_block_140 constraint_block_item { $$ = $1; P($$, $2); }
;

constraint_block_item:
SOLVE_ solve_before_list BEFORE_ solve_before_list ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| constraint_expression
;

constraint_declaration:
constraint_declaration_139 CONSTRAINT_ constraint_identifier constraint_block { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

constraint_declaration_139:
%empty { C($$); }
| STATIC_ { C($$); T($$, @1, zero, zero); }
;

constraint_expression:
constraint_expression_143 expression_or_dist ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| uniqueness_constraint ';' { $$ = $1; T($$, @2, zero, zero); }
| expression MG constraint_set { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| IF_ '(' expression ')' constraint_set constraint_expression_144 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
| FOREACH_ '(' ps_or_hierarchical_array_identifier loop_variables ')' constraint_set { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| DISABLE_ SOFT_ constraint_primary ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

constraint_expression_143:
%empty { C($$); }
| SOFT_ { C($$); T($$, @1, zero, zero); }
;

constraint_expression_144:
%empty { C($$); }
| ELSE_ constraint_set { C($$); T($$, @1, zero, zero); P($$, $2); }
;

constraint_expression_145:
%empty /* { C($$); } -- ignore */
| loop_variables /* ignore */
;

constraint_identifier:
identifier
;

constraint_primary:
constraint_primary_142 hierarchical_identifier select { $$ = $1; P($$, $2); P($$, $3); }
;

constraint_primary_142:
%empty { C($$); }
| implicit_class_handle '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
;

constraint_prototype:
constraint_prototype_149 constraint_declaration_139 CONSTRAINT_ constraint_identifier ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

constraint_prototype_149:
%empty /* { C($$); } -- ignore */
| constraint_prototype_qualifier
;

constraint_prototype_qualifier:
EXTERN_ { C($$); T($$, @1, zero, zero); }
| PURE_ { C($$); T($$, @1, zero, zero); }
;

constraint_set:
constraint_expression
| '{' constraint_set_146 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

constraint_set_146:
%empty { C($$); }
| constraint_set_146 constraint_expression { $$ = $1; P($$, $2); }
;

continuous_assign:
ASSIGN_ gate_instantiation_352 net_declaration_159 list_of_net_assignments ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| ASSIGN_ net_declaration_160 list_of_variable_assignments ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

controlled_reference_event:
controlled_timing_check_event
;

controlled_timing_check_event:
timing_check_event_control specify_terminal_descriptor timing_check_event_507 { $$ = $1; P($$, $2); P($$, $3); }
;

cover_cross:
cover_cross_342 CROSS_ list_of_cross_items cover_point_329 cross_body { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

cover_cross_342:
%empty { C($$); }
| cross_identifier ':' { $$ = $1; T($$, @2, zero, zero); }
;

cover_point:
cover_point_327 COVERPOINT_ expression cover_point_329 bins_or_empty { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

cover_point_327:
%empty { C($$); }
| cover_point_327_327 cover_point_identifier ':' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

cover_point_327_327:
%empty /* { C($$); } -- ignore */
| data_type_or_implicit
;

cover_point_329:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

cover_point_identifier:
identifier
;

cover_property_statement:
COVER_ PROPERTY_ '(' property_spec ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

cover_sequence_statement:
COVER_ SEQUENCE_ '(' cover_sequence_statement_259 cover_sequence_statement_260 sequence_expr ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); P($$, $5); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
;

cover_sequence_statement_259:
%empty { C($$); }
| clocking_event
;

cover_sequence_statement_260:
%empty { C($$); }
| DISABLE_ IFF_ '(' expression_or_dist ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

coverage_event:
clocking_event
| WITH_ FUNCTION_ SAMPLE_ '(' class_constructor_prototype_131_131 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
| ATAT '(' block_event_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

coverage_option:
OPTION_ '.' member_identifier '=' expression { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| TYPE_OPTION_ '.' member_identifier '=' constant_expression { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

coverage_spec:
cover_point
| cover_cross
;

coverage_spec_or_option:
coverage_spec_or_option_324 coverage_spec { $$ = $1; P($$, $2); }
| coverage_spec_or_option_325 coverage_option ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

coverage_spec_or_option_324:
%empty { C($$); }
| coverage_spec_or_option_324 attribute_instance { $$ = $1; P($$, $2); }
;

coverage_spec_or_option_325:
%empty { C($$); }
| coverage_spec_or_option_325 attribute_instance { $$ = $1; P($$, $2); }
;

covergroup_declaration:
COVERGROUP_ covergroup_identifier class_constructor_prototype_131 covergroup_declaration_321 ';' covergroup_declaration_322 ENDGROUP_ covergroup_declaration_323 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
;

covergroup_declaration_321:
%empty { C($$); }
| coverage_event
;

covergroup_declaration_322:
%empty { C($$); }
| covergroup_declaration_322 coverage_spec_or_option { $$ = $1; P($$, $2); }
;

covergroup_declaration_323:
%empty { C($$); }
| ':' covergroup_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

covergroup_expression:
expression
;

covergroup_identifier:
identifier
;

covergroup_range_list:
covergroup_value_range covergroup_range_list_350 { $$ = $1; P($$, $2); }
;

covergroup_range_list_350:
%empty { C($$); }
| covergroup_range_list_350 ',' covergroup_value_range { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

covergroup_value_range:
covergroup_expression
| '[' covergroup_expression ':' covergroup_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

cross_body:
'{' cross_body_344 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| ';' { C($$); T($$, @1, zero, zero); }
;

cross_body_344:
%empty { C($$); }
| cross_body_344 cross_body_item ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

cross_body_item:
function_declaration
| bins_selection_or_option ';' { $$ = $1; T($$, @2, zero, zero); }
;

cross_identifier:
identifier
;

cross_item:
identifier
;

cross_set_expression:
covergroup_expression
;

current_state:
level_symbol
;

cycle_delay:
NN integral_number { C($$); T($$, @1, zero, zero); P($$, $2); }
| NN identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| NN '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

cycle_delay_const_range_expression:
constant_expression ':' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| constant_expression ':' '$' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

cycle_delay_range:
NN constant_primary { C($$); T($$, @1, zero, zero); P($$, $2); }
| NN '[' cycle_delay_const_range_expression ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| NNOSBSCSB { C($$); T($$, @1, zero, zero); }
| NNOSBPLUSCSB { C($$); T($$, @1, zero, zero); }
;

data_declaration:
data_declaration_153 data_declaration_154 module_nonansi_header_9 data_type_or_implicit list_of_variable_decl_assignments ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| type_declaration
| package_import_declaration net_type_declaration { $$ = $1; P($$, $2); }
;

data_declaration_153:
%empty { C($$); }
| CONST_ { C($$); T($$, @1, zero, zero); }
;

data_declaration_154:
%empty { C($$); }
| VAR_ { C($$); T($$, @1, zero, zero); }
;

data_event:
timing_check_event
;

data_source_expression:
expression
;

data_type:
integer_vector_type data_type_169 data_type_170 { $$ = $1; P($$, $2); P($$, $3); }
| integer_atom_type data_type_169 { $$ = $1; P($$, $2); }
| non_integer_type
| struct_union data_type_171 '{' data_type_172 '}' data_type_173 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| ENUM_ data_type_174 '{' enum_name_declaration data_type_175 '}' data_type_176 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); P($$, $7); }
| STRING_ { C($$); T($$, @1, zero, zero); }
| CHANDLE_ { C($$); T($$, @1, zero, zero); }
| VIRTUAL_ data_type_177 interface_identifier interface_class_type_50 interface_port_header_75 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); }
| data_type_178 type_identifier data_type_179 { $$ = $1; P($$, $2); P($$, $3); }
| class_type
| EVENT_ { C($$); T($$, @1, zero, zero); }
| ps_covergroup_identifier
| type_reference
;

data_type_169:
%empty { C($$); }
| signing
;

data_type_170:
%empty { C($$); }
| data_type_170 packed_dimension { $$ = $1; P($$, $2); }
;

data_type_171:
%empty { C($$); }
| PACKED_ data_type_169 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

data_type_172:
struct_union_member
| data_type_172 struct_union_member { $$ = $1; P($$, $2); }
;

data_type_173:
%empty { C($$); }
| data_type_173 packed_dimension { $$ = $1; P($$, $2); }
;

data_type_174:
%empty { C($$); }
| enum_base_type
;

data_type_175:
%empty { C($$); }
| data_type_175 ',' enum_name_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

data_type_176:
%empty { C($$); }
| data_type_176 packed_dimension { $$ = $1; P($$, $2); }
;

data_type_177:
%empty { C($$); }
| INTERFACE_ { C($$); T($$, @1, zero, zero); }
;

data_type_178:
%empty /* { C($$); } -- ignore */
| class_scope
| package_scope
;

data_type_179:
%empty { C($$); }
| data_type_179 packed_dimension { $$ = $1; P($$, $2); }
;

data_type_or_implicit:
data_type
| implicit_data_type
;

data_type_or_void:
data_type
| VOID_ { C($$); T($$, @1, zero, zero); }
;

default_clause:
DEFAULT_ { C($$); T($$, @1, zero, zero); }
;

default_skew:
INPUT_ clocking_skew { C($$); T($$, @1, zero, zero); P($$, $2); }
| OUTPUT_ clocking_skew { C($$); T($$, @1, zero, zero); P($$, $2); }
| INPUT_ clocking_skew OUTPUT_ clocking_skew { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); }
;

deferred_immediate_assert_statement:
ASSERT_ N0 '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| ASSERT_ FINAL_ '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

deferred_immediate_assertion_item:
concurrent_assertion_item_258 deferred_immediate_assertion_statement { $$ = $1; P($$, $2); }
;

deferred_immediate_assertion_statement:
deferred_immediate_assert_statement
| deferred_immediate_assume_statement
| deferred_immediate_cover_statement
;

deferred_immediate_assume_statement:
ASSUME_ N0 '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| ASSUME_ FINAL_ '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

deferred_immediate_cover_statement:
COVER_ N0 '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| COVER_ FINAL_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

defparam_assignment:
hierarchical_parameter_identifier '=' constant_mintypmax_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

delay_control:
'#' delay_value { C($$); T($$, @1, zero, zero); P($$, $2); }
| '#' '(' mintypmax_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

delay_or_event_control:
delay_control
| event_control
| REPEAT_ '(' expression ')' event_control { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

delay_value:
unsigned_number
| real_number
| ps_identifier
| time_literal
| _1step { C($$); T($$, @1, zero, zero); }
;

delay2:
'#' delay_value { C($$); T($$, @1, zero, zero); P($$, $2); }
| '#' '(' mintypmax_expression delay3_188_188 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

delay3:
'#' delay_value { C($$); T($$, @1, zero, zero); P($$, $2); }
| '#' '(' mintypmax_expression delay3_188 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

delay3_188:
%empty { C($$); }
| ',' mintypmax_expression delay3_188_188 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

delay3_188_188:
%empty { C($$); }
| ',' mintypmax_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

delayed_data:
terminal_identifier
| terminal_identifier '[' constant_mintypmax_expression ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

delayed_reference:
terminal_identifier
| terminal_identifier '[' constant_mintypmax_expression ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

description:
module_declaration
| udp_declaration
| interface_declaration
| program_declaration
| package_declaration
| description_6 package_item { $$ = $1; P($$, $2); }
| description_7 bind_directive { $$ = $1; P($$, $2); }
| config_declaration
;

description_6:
%empty { C($$); }
| description_6 attribute_instance { $$ = $1; P($$, $2); }
;

description_7:
%empty /* { C($$); } -- ignore */
| description_7 attribute_instance { $$ = $1; P($$, $2); }
;

design_statement:
DESIGN_ opt_dotted_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

design_statement_97:
%empty /* { C($$); } -- ignore */
| design_statement_97 design_statement_97_97 cell_identifier /* { $$ = $1; P($$, $2); P($$, $3); } -- ignore */
;

design_statement_97_97:
%empty /* { C($$); } -- ignore */
| library_identifier '.' /* { $$ = $1; T($$, @2, zero, zero); } -- ignore */
;

disable_statement:
DISABLE_ hierarchical_task_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| DISABLE_ hierarchical_block_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| DISABLE_ FORK_ ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

dist_item:
value_range dist_item_148 { $$ = $1; P($$, $2); }
;

dist_item_148:
%empty { C($$); }
| dist_weight
;

dist_list:
dist_item dist_list_147 { $$ = $1; P($$, $2); }
;

dist_list_147:
%empty { C($$); }
| dist_list_147 ',' dist_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

dist_weight:
CE expression { C($$); T($$, @1, zero, zero); P($$, $2); }
| CV expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

dotted_identifier:
identifier
| identifier '.' identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

dpi_function_import_property:
CONTEXT_ { C($$); T($$, @1, zero, zero); }
| PURE_ { C($$); T($$, @1, zero, zero); }
;

dpi_function_proto:
function_prototype
;

dpi_import_export:
IMPORT_ dpi_spec_string dpi_import_export_231 dpi_import_export_232 dpi_function_proto ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| IMPORT_ dpi_spec_string dpi_import_export_233 dpi_import_export_232 dpi_task_proto ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| EXPORT_ dpi_spec_string dpi_import_export_232 FUNCTION_ function_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
| EXPORT_ dpi_spec_string dpi_import_export_232 TASK_ task_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

dpi_import_export_231:
%empty { C($$); }
| dpi_function_import_property
;

dpi_import_export_232:
%empty { C($$); }
| c_identifier '=' { $$ = $1; T($$, @2, zero, zero); }
;

dpi_import_export_233:
%empty { C($$); }
| dpi_task_import_property
;

dpi_spec_string:
DPIMC { C($$); T($$, @1, zero, zero); }
| DPI { C($$); T($$, @1, zero, zero); }
;

dpi_task_import_property:
CONTEXT_ { C($$); T($$, @1, zero, zero); }
;

dpi_task_proto:
task_prototype
;

drive_strength:
'(' strength0 ',' strength1 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' strength1 ',' strength0 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' strength0 ',' HIGHZ1_ ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); T($$, @5, zero, zero); }
| '(' strength1 ',' HIGHZ0_ ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); T($$, @5, zero, zero); }
| '(' HIGHZ0_ ',' strength1 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' HIGHZ1_ ',' strength0 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

dynamic_array_new:
NEW_ '[' expression ']' dynamic_array_new_223 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

dynamic_array_new_223:
%empty { C($$); }
| '(' expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

dynamic_array_variable_identifier:
variable_identifier
;

edge_control_specifier:
EDGE_ '[' edge_descriptor edge_control_specifier_508 ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

edge_control_specifier_508:
%empty { C($$); }
| edge_control_specifier_508 ',' edge_descriptor { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

edge_descriptor:
_01 { C($$); T($$, @1, zero, zero); }
| _10 { C($$); T($$, @1, zero, zero); }
| z_or_x zero_or_one { $$ = $1; P($$, $2); }
| zero_or_one z_or_x { $$ = $1; P($$, $2); }
;

edge_identifier:
POSEDGE_ { C($$); T($$, @1, zero, zero); }
| NEGEDGE_ { C($$); T($$, @1, zero, zero); }
| EDGE_ { C($$); T($$, @1, zero, zero); }
;

edge_indicator:
'(' level_symbol level_symbol ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| edge_symbol
;

edge_input_list:
edge_input_list_413 edge_indicator edge_input_list_414 /* { $$ = $1; P($$, $2); P($$, $3); } -- ignore */
;

edge_input_list_413:
%empty /* { C($$); } -- ignore */
| edge_input_list_413 level_symbol /* { $$ = $1; P($$, $2); } -- ignore */
;

edge_input_list_414:
%empty /* { C($$); } -- ignore */
| edge_input_list_414 level_symbol /* { $$ = $1; P($$, $2); } -- ignore */
;

edge_sensitive_path_declaration:
parallel_edge_sensitive_path_description '=' path_delay_value { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| full_edge_sensitive_path_description '=' path_delay_value { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

edge_symbol:
'r' { C($$); T($$, @1, zero, zero); }
| 'R' { C($$); T($$, @1, zero, zero); }
| 'f' { C($$); T($$, @1, zero, zero); }
| 'F' { C($$); T($$, @1, zero, zero); }
| 'p' { C($$); T($$, @1, zero, zero); }
| 'P' { C($$); T($$, @1, zero, zero); }
| 'n' { C($$); T($$, @1, zero, zero); }
| 'N' { C($$); T($$, @1, zero, zero); }
| '*' { C($$); T($$, @1, zero, zero); }
;

elaboration_system_task:
Dfatal elaboration_system_task_82 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| Derror elaboration_system_task_84 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| Dwarning elaboration_system_task_84 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| Dinfo elaboration_system_task_84 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

elaboration_system_task_82:
%empty { C($$); }
| '(' finish_number elaboration_system_task_82_82 ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

elaboration_system_task_82_82:
%empty { C($$); }
| ',' list_of_arguments { C($$); T($$, @1, zero, zero); P($$, $2); }
;

elaboration_system_task_84:
%empty { C($$); }
| '(' elaboration_system_task_84_84 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

elaboration_system_task_84_84:
%empty /* { C($$); } -- ignore */
| list_of_arguments
;

empty_queue:
'{' '}' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

enable_gate_instance:
cmos_switch_instance_364 '(' output_terminal ',' input_terminal ',' enable_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); }
;

enable_gatetype:
BUFIF0_ { C($$); T($$, @1, zero, zero); }
| BUFIF1_ { C($$); T($$, @1, zero, zero); }
| NOTIF0_ { C($$); T($$, @1, zero, zero); }
| NOTIF1_ { C($$); T($$, @1, zero, zero); }
;

enable_terminal:
expression
;

end_edge_offset:
mintypmax_expression
;

enum_base_type:
integer_atom_type data_type_169 { $$ = $1; P($$, $2); }
| integer_vector_type data_type_169 specparam_declaration_152 { $$ = $1; P($$, $2); P($$, $3); }
| type_identifier specparam_declaration_152 { $$ = $1; P($$, $2); }
;

enum_identifier:
identifier
;

enum_name_declaration:
enum_identifier enum_name_declaration_181 ansi_port_declaration_78 { $$ = $1; P($$, $2); P($$, $3); }
;

enum_name_declaration_181:
%empty { C($$); }
| '[' integral_number enum_name_declaration_181_181 ']' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

enum_name_declaration_181_181:
%empty { C($$); }
| ':' integral_number { C($$); T($$, @1, zero, zero); P($$, $2); }
;

error_limit_value:
limit_value
;

escaped_identifier:
EID_ { C($$); T($$, @1, zero, zero); }
;

event_based_flag:
constant_expression
;

event_control:
'@' hierarchical_event_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| '@' '(' event_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| ATS { C($$); T($$, @1, zero, zero); }
| '@' OPSCP { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
| '@' ps_or_hierarchical_sequence_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

event_expression:
event_expression_432 expression event_expression_433 { $$ = $1; P($$, $2); P($$, $3); }
| sequence_instance event_expression_433 { $$ = $1; P($$, $2); }
| event_expression OR_ event_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| event_expression ',' event_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| '(' event_expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

event_expression_432:
%empty { C($$); }
| edge_identifier
;

event_expression_433:
%empty { C($$); }
| IFF_ expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

event_trigger:
MG hierarchical_event_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| MGG nonblocking_assignment_421 hierarchical_event_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

expect_property_statement:
EXPECT_ '(' property_spec ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

expression:
primary
| unary_operator expression_536 primary { $$ = $1; P($$, $2); P($$, $3); }
| inc_or_dec_expression
| '(' operator_assignment ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| expression binary_operator expression_537 expression { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| conditional_expression
| inside_expression
| tagged_union_expression
;

expression_536:
%empty { C($$); }
| expression_536 attribute_instance { $$ = $1; P($$, $2); }
;

expression_537:
%empty { C($$); }
| expression_537 attribute_instance { $$ = $1; P($$, $2); }
;

expression_or_cond_pattern:
expression
| cond_pattern
;

expression_or_dist:
expression expression_or_dist_307 { $$ = $1; P($$, $2); }
;

expression_or_dist_307:
%empty { C($$); }
| DIST_ expression_or_dist_307_307 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

expression_or_dist_307_307:
%empty { C($$); }
| expression_or_dist_307_307 dist_list { $$ = $1; P($$, $2); }
;

extern_constraint_declaration:
constraint_declaration_139 CONSTRAINT_ class_scope constraint_identifier constraint_block { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

extern_tf_declaration:
EXTERN_ method_prototype ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| EXTERN_ FORKJOIN_ task_prototype ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

file_path_spec:
STRING { C($$); T($$, @1, zero, zero); }
;

final_construct:
FINAL_ function_statement { C($$); T($$, @1, zero, zero); P($$, $2); }
;

finish_number:
'0' { C($$); T($$, @1, zero, zero); }
| '1' { C($$); T($$, @1, zero, zero); }
| '2' { C($$); T($$, @1, zero, zero); }
;

fixed_point_number:
REAL_NUMBER_ { C($$); T($$, @1, zero, zero); }
;

for_initialization:
list_of_variable_assignments
| for_variable_declaration for_initialization_458 { $$ = $1; P($$, $2); }
;

for_initialization_458:
%empty { C($$); }
| for_initialization_458 ',' for_variable_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

for_step:
for_step_assignment for_step_460 { $$ = $1; P($$, $2); }
;

for_step_460:
%empty { C($$); }
| for_step_460 ',' for_step_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

for_step_assignment:
operator_assignment
| inc_or_dec_expression
| function_subroutine_call
;

for_variable_declaration:
data_declaration_154 data_type variable_identifier '=' expression for_variable_declaration_459 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
;

for_variable_declaration_459:
%empty { C($$); }
| for_variable_declaration_459 ',' variable_identifier '=' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

formal_port_identifier:
identifier
;

full_edge_sensitive_path_description:
'(' event_expression_432 list_of_path_inputs parallel_path_description_486 SG '(' list_of_path_outputs parallel_path_description_486 ':' data_source_expression ')' ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

full_path_description:
'(' list_of_path_inputs parallel_path_description_486 SG list_of_path_outputs ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

fullskew_timing_check:
Dfullskew '(' reference_event ',' data_event ',' timing_check_limit ',' timing_check_limit timeskew_timing_check_501 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

function_body_declaration:
function_data_type_or_implicit function_body_declaration_225 function_identifier ';' function_body_declaration_226 function_body_declaration_227 ENDFUNCTION_ function_body_declaration_228 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
| function_data_type_or_implicit function_body_declaration_225 function_identifier '(' class_constructor_prototype_131_131 ')' ';' function_body_declaration_229 function_body_declaration_230 ENDFUNCTION_ function_body_declaration_228 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); P($$, $8); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
;

function_body_declaration_225:
%empty /* { C($$); } -- ignore */
| interface_identifier '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
;

function_body_declaration_226:
%empty { C($$); }
| function_body_declaration_226 tf_item_declaration { $$ = $1; P($$, $2); }
;

function_body_declaration_227:
%empty { C($$); }
| function_body_declaration_227 function_statement_or_null { $$ = $1; P($$, $2); }
;

function_body_declaration_228:
%empty { C($$); }
| ':' function_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

function_body_declaration_229:
%empty { C($$); }
| function_body_declaration_229 block_item_declaration { $$ = $1; P($$, $2); }
;

function_body_declaration_230:
%empty { C($$); }
| function_body_declaration_230 function_statement_or_null { $$ = $1; P($$, $2); }
;

function_data_type_or_implicit:
data_type_or_void
| implicit_data_type
;

function_declaration:
FUNCTION_ module_nonansi_header_9 function_body_declaration { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

function_identifier:
identifier
;

function_prototype:
FUNCTION_ data_type_or_void function_identifier class_constructor_prototype_131 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); }
;

function_statement:
statement
;

function_statement_or_null:
function_statement
| function_statement_or_null_430 ';' { $$ = $1; T($$, @2, zero, zero); }
;

function_statement_or_null_430:
%empty { C($$); }
| function_statement_or_null_430 attribute_instance { $$ = $1; P($$, $2); }
;

function_subroutine_call:
subroutine_call
;

gate_instantiation:
cmos_switchtype net_declaration_159 cmos_switch_instance gate_instantiation_351 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| enable_gatetype gate_instantiation_352 net_declaration_159 enable_gate_instance gate_instantiation_353 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| mos_switchtype net_declaration_159 mos_switch_instance gate_instantiation_354 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| n_input_gatetype gate_instantiation_352 gate_instantiation_355 n_input_gate_instance gate_instantiation_356 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| n_output_gatetype gate_instantiation_352 gate_instantiation_355 n_output_gate_instance gate_instantiation_357 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| pass_en_switchtype gate_instantiation_355 pass_enable_switch_instance gate_instantiation_358 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| pass_switchtype pass_switch_instance gate_instantiation_359 ';' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| PULLDOWN_ gate_instantiation_360 pull_gate_instance gate_instantiation_361 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| PULLUP_ gate_instantiation_362 pull_gate_instance gate_instantiation_363 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

gate_instantiation_351:
%empty { C($$); }
| gate_instantiation_351 ',' cmos_switch_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_352:
%empty { C($$); }
| drive_strength
;

gate_instantiation_353:
%empty { C($$); }
| gate_instantiation_353 ',' enable_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_354:
%empty { C($$); }
| gate_instantiation_354 ',' mos_switch_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_355:
%empty { C($$); }
| delay2
;

gate_instantiation_356:
%empty { C($$); }
| gate_instantiation_356 ',' n_input_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_357:
%empty { C($$); }
| gate_instantiation_357 ',' n_output_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_358:
%empty { C($$); }
| gate_instantiation_358 ',' pass_enable_switch_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_359:
%empty { C($$); }
| gate_instantiation_359 ',' pass_switch_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_360:
%empty { C($$); }
| pulldown_strength
;

gate_instantiation_361:
%empty { C($$); }
| gate_instantiation_361 ',' pull_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_362:
%empty { C($$); }
| pullup_strength
;

gate_instantiation_363:
%empty { C($$); }
| gate_instantiation_363 ',' pull_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

generate_block:
generate_item
| generate_block_394 BEGIN_ generate_block_395 generate_block_396 END_ generate_block_395 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

generate_block_394:
%empty { C($$); }
| generate_block_identifier ':' { $$ = $1; T($$, @2, zero, zero); }
;

generate_block_395:
%empty { C($$); }
| ':' generate_block_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

generate_block_396:
%empty { C($$); }
| generate_block_396 generate_item { $$ = $1; P($$, $2); }
;

generate_block_identifier:
identifier
;

generate_item:
module_or_generate_item
| interface_or_generate_item
| checker_or_generate_item
;

generate_region:
GENERATE_ generate_region_389 ENDGENERATE_ { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

generate_region_389:
%empty { C($$); }
| generate_region_389 generate_item { $$ = $1; P($$, $2); }
;

genvar_declaration:
GENVAR_ list_of_genvar_identifiers ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

genvar_expression:
constant_expression
;

genvar_identifier:
identifier
;

genvar_initialization:
genvar_initialization_390 genvar_identifier '=' constant_expression { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
;

genvar_initialization_390:
%empty { C($$); }
| GENVAR_ { C($$); T($$, @1, zero, zero); }
;

genvar_iteration:
genvar_identifier assignment_operator genvar_expression { $$ = $1; P($$, $2); P($$, $3); }
| inc_or_dec_operator genvar_identifier { $$ = $1; P($$, $2); }
| genvar_identifier inc_or_dec_operator { $$ = $1; P($$, $2); }
;

goto_repetition:
OSBMG const_or_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

hierarchical_array_identifier:
hierarchical_identifier
;

hierarchical_block_identifier:
hierarchical_identifier
;

hierarchical_btf_identifier:
hierarchical_tf_identifier
| hierarchical_block_identifier
| hierarchical_btf_identifier_326 method_identifier { $$ = $1; P($$, $2); }
;

hierarchical_btf_identifier_326:
%empty /* { C($$); } -- ignore */
| hierarchical_identifier '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
;

hierarchical_event_identifier:
hierarchical_identifier
;

hierarchical_identifier:
hierarchical_identifier_558 hierarchical_identifier_559 identifier { $$ = $1; P($$, $2); P($$, $3); }
;

hierarchical_identifier_558:
%empty { C($$); }
| Droot '.' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

hierarchical_identifier_559:
%empty { C($$); }
| hierarchical_identifier_559 identifier constant_bit_select '.' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

hierarchical_instance:
name_of_instance '(' hierarchical_instance_372 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

hierarchical_instance_372:
%empty { C($$); }
| list_of_port_connections
;

hierarchical_net_identifier:
hierarchical_identifier
;

hierarchical_parameter_identifier:
hierarchical_identifier
;

hierarchical_property_identifier:
hierarchical_identifier
;

hierarchical_sequence_identifier:
hierarchical_identifier
;

hierarchical_task_identifier:
hierarchical_identifier /* ignore */
;

hierarchical_tf_identifier:
hierarchical_identifier
;

hierarchical_variable_identifier:
hierarchical_identifier
;

hold_timing_check:
Dhold '(' reference_event ',' data_event ',' timing_check_limit setup_timing_check_490 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

identifier:
simple_identifier
| escaped_identifier
;

identifier_list:
identifier identifier_list_150 { $$ = $1; P($$, $2); }
;

identifier_list_150:
%empty { C($$); }
| identifier_list_150 ',' identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

if_generate_construct:
IF_ '(' constant_expression ')' generate_block if_generate_construct_391 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
;

if_generate_construct_391:
%empty { C($$); }
| ELSE_ generate_block { C($$); T($$, @1, zero, zero); P($$, $2); }
;

immediate_assertion_statement:
simple_immediate_assertion_statement
| deferred_immediate_assertion_statement
;

implicit_class_handle:
THIS_ '.' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
| SUPER_ '.' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
| THIS_ '.' SUPER_ '.' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); T($$, @4, zero, zero); }
;

implicit_data_type:
data_type_169 implicit_data_type_180 { $$ = $1; P($$, $2); }
;

implicit_data_type_180:
%empty { C($$); }
| implicit_data_type_180 packed_dimension { $$ = $1; P($$, $2); }
;

import_export:
IMPORT_ { C($$); T($$, @1, zero, zero); }
| EXPORT_ { C($$); T($$, @1, zero, zero); }
;

inc_or_dec_expression:
inc_or_dec_operator inc_or_dec_expression_530 variable_lvalue { $$ = $1; P($$, $2); P($$, $3); }
| variable_lvalue inc_or_dec_expression_531 inc_or_dec_operator { $$ = $1; P($$, $2); P($$, $3); }
;

inc_or_dec_expression_530:
%empty { C($$); }
| inc_or_dec_expression_530 attribute_instance { $$ = $1; P($$, $2); }
;

inc_or_dec_expression_531:
%empty { C($$); }
| inc_or_dec_expression_531 attribute_instance { $$ = $1; P($$, $2); }
;

inc_or_dec_operator:
PLUSPLUS { C($$); T($$, @1, zero, zero); }
| MM { C($$); T($$, @1, zero, zero); }
;

include_statement:
INCLUDE_ file_path_spec ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

index_variable_identifier:
identifier /* ignore */
;

indexed_range:
expression PLUSC constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression MC constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

init_val:
_1APOSb0 { C($$); T($$, @1, zero, zero); }
| _1APOSb1 { C($$); T($$, @1, zero, zero); }
| _1APOSbx { C($$); T($$, @1, zero, zero); }
| _1APOSbX { C($$); T($$, @1, zero, zero); }
| _1APOSB0 { C($$); T($$, @1, zero, zero); }
| _1APOSB1 { C($$); T($$, @1, zero, zero); }
| _1APOSBx { C($$); T($$, @1, zero, zero); }
| _1APOSBX { C($$); T($$, @1, zero, zero); }
| '1' { C($$); T($$, @1, zero, zero); }
| '0' { C($$); T($$, @1, zero, zero); }
;

initial_construct:
INITIAL_ statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); }
;

inout_declaration:
INOUT_ net_port_type list_of_port_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

inout_port_identifier:
identifier /* ignore */
;

inout_terminal:
net_lvalue
;

input_declaration:
INPUT_ net_port_type list_of_port_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| INPUT_ variable_port_type list_of_variable_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

input_identifier:
identifier
| interface_identifier '.' port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

input_port_identifier:
identifier
;

input_terminal:
expression
;

inside_expression:
expression INSIDE_ '{' open_range_list '}' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

inst_clause:
INSTANCE_ inst_name { C($$); T($$, @1, zero, zero); P($$, $2); }
;

inst_name:
topmodule_identifier inst_name_99 { $$ = $1; P($$, $2); }
;

inst_name_99:
%empty { C($$); }
| inst_name_99 '.' instance_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

instance_identifier:
identifier
;

integer_atom_type:
BYTE_ { C($$); T($$, @1, zero, zero); }
| SHORTINT_ { C($$); T($$, @1, zero, zero); }
| INT_ { C($$); T($$, @1, zero, zero); }
| LONGINT_ { C($$); T($$, @1, zero, zero); }
| INTEGER_ { C($$); T($$, @1, zero, zero); }
| TIME_ { C($$); T($$, @1, zero, zero); }
;

integer_covergroup_expression:
covergroup_expression
;

integer_type:
integer_vector_type
| integer_atom_type
;

integer_vector_type:
BIT_ { C($$); T($$, @1, zero, zero); }
| LOGIC_ { C($$); T($$, @1, zero, zero); }
| REG_ { C($$); T($$, @1, zero, zero); }
;

integral_number:
INTEGRAL_NUMBER_ { C($$); T($$, @1, zero, zero); }
;

interface_ansi_header:
interface_ansi_header_27 INTERFACE_ module_nonansi_header_9 interface_identifier interface_ansi_header_28 module_nonansi_header_11 module_ansi_header_14 ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

interface_ansi_header_27:
%empty { C($$); }
| interface_ansi_header_27 attribute_instance { $$ = $1; P($$, $2); }
;

interface_ansi_header_28:
%empty { C($$); }
| interface_ansi_header_28 package_import_declaration { $$ = $1; P($$, $2); }
;

interface_class_declaration:
INTERFACE_ CLASS_ class_identifier module_nonansi_header_11 interface_class_declaration_51 ';' interface_class_declaration_53 ENDCLASS_ class_declaration_49 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

interface_class_declaration_51:
%empty { C($$); }
| EXTENDS_ interface_class_type interface_class_declaration_51_51 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

interface_class_declaration_51_51:
%empty { C($$); }
| interface_class_declaration_51_51 ',' interface_class_type { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

interface_class_declaration_53:
%empty { C($$); }
| interface_class_declaration_53 interface_class_item { $$ = $1; P($$, $2); }
;

interface_class_item:
type_declaration
| interface_class_item_54 interface_class_method { $$ = $1; P($$, $2); }
| local_parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| ';' { C($$); T($$, @1, zero, zero); }
;

interface_class_item_54:
%empty { C($$); }
| interface_class_item_54 attribute_instance { $$ = $1; P($$, $2); }
;

interface_class_method:
PURE_ VIRTUAL_ method_prototype ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

interface_class_type:
ps_class_identifier interface_class_type_50 { $$ = $1; P($$, $2); }
;

interface_class_type_50:
%empty { C($$); }
| parameter_value_assignment
;

interface_declaration:
interface_nonansi_header source_text_4 interface_declaration_20 ENDINTERFACE_ interface_declaration_21 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| interface_ansi_header source_text_4 interface_declaration_22 ENDINTERFACE_ interface_declaration_21 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| interface_declaration_23 INTERFACE_ interface_identifier '(' DOTS ')' ';' source_text_4 interface_declaration_24 ENDINTERFACE_ interface_declaration_21 { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); T($$, @5, zero, zero); T($$, @6, zero, zero); T($$, @7, zero, zero); P($$, $8); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
| EXTERN_ interface_nonansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
| EXTERN_ interface_ansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
| interface_class_declaration
;

interface_declaration_20:
%empty { C($$); }
| interface_declaration_20 interface_item { $$ = $1; P($$, $2); }
;

interface_declaration_21:
%empty { C($$); }
| ':' interface_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

interface_declaration_22:
%empty { C($$); }
| interface_declaration_22 non_port_interface_item { $$ = $1; P($$, $2); }
;

interface_declaration_23:
%empty /* { C($$); } -- ignore */
| interface_declaration_23 attribute_instance { $$ = $1; P($$, $2); }
;

interface_declaration_24:
%empty { C($$); }
| interface_declaration_24 interface_item { $$ = $1; P($$, $2); }
;

interface_identifier:
identifier
;

interface_instance_identifier:
identifier
;

interface_instantiation:
interface_identifier interface_class_type_50 hierarchical_instance interface_instantiation_380 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

interface_instantiation_380:
%empty { C($$); }
| interface_instantiation_380 ',' hierarchical_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

interface_item:
port_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| non_port_interface_item
;

interface_nonansi_header:
interface_nonansi_header_25 INTERFACE_ module_nonansi_header_9 interface_identifier interface_nonansi_header_26 module_nonansi_header_11 list_of_ports ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

interface_nonansi_header_25:
%empty /* { C($$); } -- ignore */
| interface_nonansi_header_25 attribute_instance { $$ = $1; P($$, $2); }
;

interface_nonansi_header_26:
%empty { C($$); }
| interface_nonansi_header_26 package_import_declaration { $$ = $1; P($$, $2); }
;

interface_or_generate_item:
interface_or_generate_item_104 module_common_item { $$ = $1; P($$, $2); }
| interface_or_generate_item_105 modport_declaration { $$ = $1; P($$, $2); }
| interface_or_generate_item_106 extern_tf_declaration { $$ = $1; P($$, $2); }
;

interface_or_generate_item_104:
%empty { C($$); }
| interface_or_generate_item_104 attribute_instance { $$ = $1; P($$, $2); }
;

interface_or_generate_item_105:
%empty { C($$); }
| interface_or_generate_item_105 attribute_instance { $$ = $1; P($$, $2); }
;

interface_or_generate_item_106:
%empty { C($$); }
| interface_or_generate_item_106 attribute_instance { $$ = $1; P($$, $2); }
;

interface_port_declaration:
interface_identifier list_of_interface_identifiers { $$ = $1; P($$, $2); }
| interface_identifier '.' modport_identifier list_of_interface_identifiers { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

interface_port_header:
interface_identifier interface_port_header_75 { $$ = $1; P($$, $2); }
| INTERFACE_ interface_port_header_75 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

interface_port_header_75:
%empty { C($$); }
| '.' modport_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

join_keyword:
JOIN_ { C($$); T($$, @1, zero, zero); }
| JOIN_ANY_ { C($$); T($$, @1, zero, zero); }
| JOIN_NONE_ { C($$); T($$, @1, zero, zero); }
;

jump_statement:
RETURN_ ansi_port_declaration_81 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| BREAK_ ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
| CONTINUE_ ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

let_actual_arg:
expression
;

let_declaration:
LET_ let_identifier let_declaration_309 '=' expression ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

let_declaration_309:
%empty { C($$); }
| '(' let_declaration_309_309 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

let_declaration_309_309:
%empty { C($$); }
| let_port_list
;

let_expression:
let_expression_314 let_identifier let_expression_315 { $$ = $1; P($$, $2); P($$, $3); }
;

let_expression_314:
%empty /* { C($$); } -- ignore */
| package_scope
;

let_expression_315:
%empty { C($$); }
| '(' let_expression_315_315 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

let_expression_315_315:
%empty { C($$); }
| let_list_of_arguments
;

let_formal_type:
data_type_or_implicit
| UNTYPED_ { C($$); T($$, @1, zero, zero); }
;

let_identifier:
identifier
;

let_list_of_arguments:
let_list_of_arguments_317 let_list_of_arguments_318 let_list_of_arguments_319 { $$ = $1; P($$, $2); P($$, $3); }
| '.' identifier '(' let_list_of_arguments_317 ')' let_list_of_arguments_320 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

let_list_of_arguments_317:
%empty { C($$); }
| let_actual_arg
;

let_list_of_arguments_318:
%empty { C($$); }
| let_list_of_arguments_318 ',' let_list_of_arguments_317 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

let_list_of_arguments_319:
%empty { C($$); }
| let_list_of_arguments_319 ',' '.' identifier '(' let_list_of_arguments_317 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

let_list_of_arguments_320:
%empty { C($$); }
| let_list_of_arguments_320 ',' '.' identifier '(' let_list_of_arguments_317 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

let_port_item:
let_port_item_312 let_formal_type formal_port_identifier let_port_item_313 list_of_tf_variable_identifiers_203 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); }
;

let_port_item_312:
%empty { C($$); }
| let_port_item_312 attribute_instance { $$ = $1; P($$, $2); }
;

let_port_item_313:
%empty { C($$); }
| let_port_item_313 variable_dimension { $$ = $1; P($$, $2); }
;

let_port_list:
let_port_item let_port_list_311 { $$ = $1; P($$, $2); }
;

let_port_list_311:
%empty { C($$); }
| let_port_list_311 ',' let_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

level_input_list:
level_input_list_412 /* ignore */
;

level_input_list_412:
level_symbol /* ignore */
| level_input_list_412 level_symbol /* { $$ = $1; P($$, $2); } -- ignore */
;

level_symbol:
'0' { C($$); T($$, @1, zero, zero); }
| '1' { C($$); T($$, @1, zero, zero); }
| 'x' { C($$); T($$, @1, zero, zero); }
| 'X' { C($$); T($$, @1, zero, zero); }
| '?' { C($$); T($$, @1, zero, zero); }
| 'b' { C($$); T($$, @1, zero, zero); }
| 'B' { C($$); T($$, @1, zero, zero); }
;

level_symbol_0n:
%empty { C($$); }
| level_symbol_0n level_symbol { $$ = $1; P($$, $2); }
;

liblist_clause:
LIBLIST_ liblist_clause_100 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

liblist_clause_100:
%empty { C($$); }
| liblist_clause_100 library_identifier { $$ = $1; P($$, $2); }
;

library_declaration:
LIBRARY_ library_identifier file_path_spec library_declaration_1 library_declaration_2 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

library_declaration_1:
%empty { C($$); }
| library_declaration_1 ',' file_path_spec { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

library_declaration_2:
%empty { C($$); }
| Mincdir file_path_spec library_declaration_2_2 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

library_declaration_2_2:
%empty { C($$); }
| library_declaration_2_2 ',' file_path_spec { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

library_description:
library_declaration
| include_statement
| config_declaration
| ';' { C($$); T($$, @1, zero, zero); }
;

library_identifier:
identifier
;

library_text:
library_text_0
;

library_text_0:
%empty { C($$); }
| library_text_0 library_description { $$ = $1; P($$, $2); }
;

lifetime:
STATIC_ { C($$); T($$, @1, zero, zero); }
| AUTOMATIC_ { C($$); T($$, @1, zero, zero); }
;

limit_value:
constant_mintypmax_expression
;

list_of_arguments:
ansi_port_declaration_81 list_of_arguments_518 list_of_arguments_519 { $$ = $1; P($$, $2); P($$, $3); }
| '.' identifier '(' ansi_port_declaration_81 ')' list_of_arguments_520 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

list_of_arguments_518:
%empty { C($$); }
| list_of_arguments_518 ',' ansi_port_declaration_81 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_arguments_519:
%empty { C($$); }
| list_of_arguments_519 ',' '.' identifier '(' ansi_port_declaration_81 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

list_of_arguments_520:
%empty { C($$); }
| list_of_arguments_520 ',' '.' identifier '(' ansi_port_declaration_81 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

list_of_checker_port_connections:
ordered_checker_port_connection list_of_checker_port_connections_383 { $$ = $1; P($$, $2); }
| named_checker_port_connection list_of_checker_port_connections_384 { $$ = $1; P($$, $2); }
;

list_of_checker_port_connections_383:
%empty { C($$); }
| list_of_checker_port_connections_383 ',' ordered_checker_port_connection { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_checker_port_connections_384:
%empty { C($$); }
| list_of_checker_port_connections_384 ',' named_checker_port_connection { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_clocking_decl_assign:
clocking_decl_assign list_of_clocking_decl_assign_469 { $$ = $1; P($$, $2); }
;

list_of_clocking_decl_assign_469:
%empty { C($$); }
| list_of_clocking_decl_assign_469 ',' clocking_decl_assign { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_cross_items:
cross_item ',' cross_item list_of_cross_items_343 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

list_of_cross_items_343:
%empty { C($$); }
| list_of_cross_items_343 ',' cross_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_defparam_assignments:
defparam_assignment list_of_defparam_assignments_190 { $$ = $1; P($$, $2); }
;

list_of_defparam_assignments_190:
%empty { C($$); }
| list_of_defparam_assignments_190 ',' defparam_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_genvar_identifiers:
genvar_identifier list_of_genvar_identifiers_191 { $$ = $1; P($$, $2); }
;

list_of_genvar_identifiers_191:
%empty { C($$); }
| list_of_genvar_identifiers_191 ',' genvar_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_interface_identifiers:
interface_identifier list_of_interface_identifiers_192 list_of_interface_identifiers_193 { $$ = $1; P($$, $2); P($$, $3); }
;

list_of_interface_identifiers_192:
%empty { C($$); }
| list_of_interface_identifiers_192 unpacked_dimension { $$ = $1; P($$, $2); }
;

list_of_interface_identifiers_193:
%empty { C($$); }
| list_of_interface_identifiers_193 ',' interface_identifier list_of_interface_identifiers_193_193 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

list_of_interface_identifiers_193_193:
%empty { C($$); }
| list_of_interface_identifiers_193_193 unpacked_dimension { $$ = $1; P($$, $2); }
;

list_of_net_assignments:
net_assignment list_of_net_assignments_417 { $$ = $1; P($$, $2); }
;

list_of_net_assignments_417:
%empty { C($$); }
| list_of_net_assignments_417 ',' net_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_net_decl_assignments:
net_decl_assignment list_of_net_decl_assignments_195 { $$ = $1; P($$, $2); }
;

list_of_net_decl_assignments_195:
%empty { C($$); }
| list_of_net_decl_assignments_195 ',' net_decl_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_param_assignments:
param_assignment list_of_param_assignments_196 { $$ = $1; P($$, $2); }
;

list_of_param_assignments_196:
%empty { C($$); }
| list_of_param_assignments_196 ',' param_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_parameter_assignments:
ordered_parameter_assignment list_of_parameter_assignments_369 { $$ = $1; P($$, $2); }
| named_parameter_assignment list_of_parameter_assignments_370 { $$ = $1; P($$, $2); }
;

list_of_parameter_assignments_369:
%empty { C($$); }
| list_of_parameter_assignments_369 ',' ordered_parameter_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_parameter_assignments_370:
%empty { C($$); }
| list_of_parameter_assignments_370 ',' named_parameter_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_path_delay_expressions:
t_path_delay_expression
| trise_path_delay_expression ',' tfall_path_delay_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| trise_path_delay_expression ',' tfall_path_delay_expression ',' tz_path_delay_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| t01_path_delay_expression ',' t10_path_delay_expression ',' t0z_path_delay_expression ',' tz1_path_delay_expression ',' t1z_path_delay_expression ',' tz0_path_delay_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
| t01_path_delay_expression ',' t10_path_delay_expression ',' t0z_path_delay_expression ',' tz1_path_delay_expression ',' t1z_path_delay_expression ',' tz0_path_delay_expression ',' t0x_path_delay_expression ',' tx1_path_delay_expression ',' t1x_path_delay_expression ',' tx0_path_delay_expression ',' txz_path_delay_expression ',' tzx_path_delay_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); T($$, @10, zero, zero); P($$, $11); T($$, @12, zero, zero); P($$, $13); T($$, @14, zero, zero); P($$, $15); T($$, @16, zero, zero); P($$, $17); T($$, @18, zero, zero); P($$, $19); T($$, @20, zero, zero); P($$, $21); T($$, @22, zero, zero); P($$, $23); }
;

list_of_path_inputs:
specify_input_terminal_descriptor list_of_path_inputs_487 { $$ = $1; P($$, $2); }
;

list_of_path_inputs_487:
%empty { C($$); }
| list_of_path_inputs_487 ',' specify_input_terminal_descriptor { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_path_outputs:
specify_output_terminal_descriptor list_of_path_outputs_488 { $$ = $1; P($$, $2); }
;

list_of_path_outputs_488:
%empty { C($$); }
| list_of_path_outputs_488 ',' specify_output_terminal_descriptor { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_port_connections:
ordered_port_connection list_of_port_connections_374 { $$ = $1; P($$, $2); }
| named_port_connection list_of_port_connections_375 { $$ = $1; P($$, $2); }
;

list_of_port_connections_374:
%empty { C($$); }
| list_of_port_connections_374 ',' ordered_port_connection { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_port_connections_375:
%empty { C($$); }
| list_of_port_connections_375 ',' named_port_connection { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_port_declarations:
'(' list_of_port_declarations_63 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

list_of_port_declarations_63:
%empty { C($$); }
| list_of_port_declarations_63_63 ansi_port_declaration list_of_port_declarations_63_64 { $$ = $1; P($$, $2); P($$, $3); }
;

list_of_port_declarations_63_63:
%empty { C($$); }
| list_of_port_declarations_63_63 attribute_instance { $$ = $1; P($$, $2); }
;

list_of_port_declarations_63_64:
%empty { C($$); }
| list_of_port_declarations_63_64 ',' list_of_port_declarations_63_64_64 ansi_port_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

list_of_port_declarations_63_64_64:
%empty { C($$); }
| list_of_port_declarations_63_64_64 attribute_instance { $$ = $1; P($$, $2); }
;

list_of_port_identifiers:
port_identifier list_of_port_identifiers_197 list_of_port_identifiers_198 { $$ = $1; P($$, $2); P($$, $3); }
;

list_of_port_identifiers_197:
%empty { C($$); }
| list_of_port_identifiers_197 unpacked_dimension { $$ = $1; P($$, $2); }
;

list_of_port_identifiers_198:
%empty { C($$); }
| list_of_port_identifiers_198 ',' port_identifier list_of_port_identifiers_198_198 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

list_of_port_identifiers_198_198:
%empty { C($$); }
| list_of_port_identifiers_198_198 unpacked_dimension { $$ = $1; P($$, $2); }
;

list_of_ports:
'(' port list_of_ports_62 ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

list_of_ports_62:
%empty { C($$); }
| list_of_ports_62 ',' port { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_specparam_assignments:
specparam_assignment list_of_specparam_assignments_201 { $$ = $1; P($$, $2); }
;

list_of_specparam_assignments_201:
%empty { C($$); }
| list_of_specparam_assignments_201 ',' specparam_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_tf_variable_identifiers:
port_identifier list_of_tf_variable_identifiers_202 list_of_tf_variable_identifiers_203 list_of_tf_variable_identifiers_204 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
;

list_of_tf_variable_identifiers_202:
%empty { C($$); }
| list_of_tf_variable_identifiers_202 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_tf_variable_identifiers_203:
%empty { C($$); }
| '=' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

list_of_tf_variable_identifiers_204:
%empty { C($$); }
| list_of_tf_variable_identifiers_204 ',' port_identifier list_of_tf_variable_identifiers_204_204 list_of_tf_variable_identifiers_203 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

list_of_tf_variable_identifiers_204_204:
%empty { C($$); }
| list_of_tf_variable_identifiers_204_204 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_type_assignments:
type_assignment list_of_type_assignments_206 { $$ = $1; P($$, $2); }
;

list_of_type_assignments_206:
%empty { C($$); }
| list_of_type_assignments_206 ',' type_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_udp_port_identifiers:
port_identifier list_of_udp_port_identifiers_200 { $$ = $1; P($$, $2); }
;

list_of_udp_port_identifiers_200:
%empty { C($$); }
| list_of_udp_port_identifiers_200 ',' port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_variable_assignments:
variable_assignment list_of_variable_assignments_418 { $$ = $1; P($$, $2); }
;

list_of_variable_assignments_418:
%empty { C($$); }
| list_of_variable_assignments_418 ',' variable_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_variable_decl_assignments:
variable_decl_assignment list_of_variable_decl_assignments_207 { $$ = $1; P($$, $2); }
;

list_of_variable_decl_assignments_207:
%empty { C($$); }
| list_of_variable_decl_assignments_207 ',' variable_decl_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_variable_identifiers:
variable_identifier list_of_variable_identifiers_208 list_of_variable_identifiers_209 { $$ = $1; P($$, $2); P($$, $3); }
;

list_of_variable_identifiers_208:
%empty { C($$); }
| list_of_variable_identifiers_208 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_variable_identifiers_209:
%empty { C($$); }
| list_of_variable_identifiers_209 ',' variable_identifier list_of_variable_identifiers_209_209 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

list_of_variable_identifiers_209_209:
%empty { C($$); }
| list_of_variable_identifiers_209_209 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_variable_port_identifiers:
port_identifier list_of_variable_port_identifiers_211 ansi_port_declaration_78 list_of_variable_port_identifiers_212 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
;

list_of_variable_port_identifiers_211:
%empty { C($$); }
| list_of_variable_port_identifiers_211 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_variable_port_identifiers_212:
%empty { C($$); }
| list_of_variable_port_identifiers_212 ',' port_identifier list_of_variable_port_identifiers_212_212 ansi_port_declaration_78 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

list_of_variable_port_identifiers_212_212:
%empty { C($$); }
| list_of_variable_port_identifiers_212_212 variable_dimension { $$ = $1; P($$, $2); }
;

local_parameter_declaration:
LOCALPARAM_ data_type_or_implicit list_of_param_assignments { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| LOCALPARAM_ TYPE_ list_of_type_assignments { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); }
;

loop_generate_construct:
FOR_ '(' genvar_initialization ';' genvar_expression ';' genvar_iteration ')' generate_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

loop_statement:
FOREVER_ statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); }
| REPEAT_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| WHILE_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| FOR_ '(' loop_statement_456 ';' ansi_port_declaration_81 ';' loop_statement_457 ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
| DO_ statement_or_null WHILE_ '(' expression ')' ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); }
| FOREACH_ '(' ps_or_hierarchical_array_identifier loop_variables ')' statement { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

loop_statement_456:
%empty { C($$); }
| for_initialization
;

loop_statement_457:
%empty { C($$); }
| for_step
;

loop_variables:
identifier
| loop_variables ',' { $$ = $1; T($$, @2, zero, zero); }
| loop_variables ',' identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

loop_variables_461:
%empty /* { C($$); } -- ignore */
| index_variable_identifier /* ignore */
;

loop_variables_462:
%empty /* { C($$); } -- ignore */
| loop_variables_462 ',' loop_variables_461 /* { $$ = $1; T($$, @2, zero, zero); P($$, $3); } -- ignore */
;

member_identifier:
identifier
;

method_call:
method_call_root method_call_body { $$ = $1; P($$, $2); }
;

method_call_body:
method_identifier method_call_body_521 class_declaration_44_44 { $$ = $1; P($$, $2); P($$, $3); }
| built_in_method_call
;

method_call_body_521:
%empty /* { C($$); } -- ignore */
| method_call_body_521 attribute_instance { $$ = $1; P($$, $2); }
;

method_call_root:
primary '.' { $$ = $1; T($$, @2, zero, zero); }
| implicit_class_handle
;

method_identifier:
identifier
;

method_prototype:
task_prototype
| function_prototype
;

method_qualifier:
method_qualifier_133 VIRTUAL_ { $$ = $1; T($$, @2, zero, zero); }
| class_item_qualifier
;

method_qualifier_133:
%empty { C($$); }
| PURE_ { C($$); T($$, @1, zero, zero); }
;

mintypmax_expression:
expression
| expression ':' expression ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

modport_clocking_declaration:
CLOCKING_ clocking_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

modport_declaration:
MODPORT_ modport_item modport_declaration_251 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

modport_declaration_251:
%empty { C($$); }
| modport_declaration_251 ',' modport_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

modport_identifier:
identifier
;

modport_item:
modport_identifier '(' modport_ports_declaration modport_item_252 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

modport_item_252:
%empty { C($$); }
| modport_item_252 ',' modport_ports_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

modport_ports_declaration:
modport_ports_declaration_253 modport_simple_ports_declaration { $$ = $1; P($$, $2); }
| modport_ports_declaration_254 modport_tf_ports_declaration { $$ = $1; P($$, $2); }
| modport_ports_declaration_255 modport_clocking_declaration { $$ = $1; P($$, $2); }
;

modport_ports_declaration_253:
%empty { C($$); }
| modport_ports_declaration_253 attribute_instance { $$ = $1; P($$, $2); }
;

modport_ports_declaration_254:
%empty { C($$); }
| modport_ports_declaration_254 attribute_instance { $$ = $1; P($$, $2); }
;

modport_ports_declaration_255:
%empty { C($$); }
| modport_ports_declaration_255 attribute_instance { $$ = $1; P($$, $2); }
;

modport_simple_port:
port_identifier
| '.' port_identifier '(' ansi_port_declaration_81 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

modport_simple_ports_declaration:
port_direction modport_simple_port modport_simple_ports_declaration_256 { $$ = $1; P($$, $2); P($$, $3); }
;

modport_simple_ports_declaration_256:
%empty { C($$); }
| modport_simple_ports_declaration_256 ',' modport_simple_port { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

modport_tf_port:
method_prototype
| tf_identifier
;

modport_tf_ports_declaration:
import_export modport_tf_port modport_tf_ports_declaration_257 { $$ = $1; P($$, $2); P($$, $3); }
;

modport_tf_ports_declaration_257:
%empty { C($$); }
| modport_tf_ports_declaration_257 ',' modport_tf_port { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

module_ansi_header:
module_ansi_header_12 module_keyword module_nonansi_header_9 module_identifier module_ansi_header_13 module_nonansi_header_11 module_ansi_header_14 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

module_ansi_header_12:
%empty { C($$); }
| module_ansi_header_12 attribute_instance { $$ = $1; P($$, $2); }
;

module_ansi_header_13:
%empty { C($$); }
| module_ansi_header_13 package_import_declaration { $$ = $1; P($$, $2); }
;

module_ansi_header_14:
%empty { C($$); }
| list_of_port_declarations
;

module_common_item:
module_or_generate_item_declaration
| interface_instantiation
| program_instantiation
| assertion_item
| bind_directive
| continuous_assign
| net_alias
| initial_construct
| final_construct
| always_construct
| loop_generate_construct
| conditional_generate_construct
| elaboration_system_task
;

module_declaration:
module_nonansi_header source_text_4 module_declaration_15 ENDMODULE_ module_declaration_16 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| module_ansi_header source_text_4 module_declaration_17 ENDMODULE_ module_declaration_16 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| module_declaration_18 module_keyword module_nonansi_header_9 module_identifier '(' DOTS ')' ';' source_text_4 module_declaration_19 ENDMODULE_ module_declaration_16 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); T($$, @7, zero, zero); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); P($$, $12); }
| EXTERN_ module_nonansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
| EXTERN_ module_ansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
;

module_declaration_15:
%empty { C($$); }
| module_declaration_15 module_item { $$ = $1; P($$, $2); }
;

module_declaration_16:
%empty { C($$); }
| ':' module_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

module_declaration_17:
%empty { C($$); }
| module_declaration_17 non_port_module_item { $$ = $1; P($$, $2); }
;

module_declaration_18:
%empty /* { C($$); } -- ignore */
| module_declaration_18 attribute_instance { $$ = $1; P($$, $2); }
;

module_declaration_19:
%empty { C($$); }
| module_declaration_19 module_item { $$ = $1; P($$, $2); }
;

module_identifier:
identifier
;

module_instantiation:
module_identifier interface_class_type_50 hierarchical_instance module_instantiation_367 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

module_instantiation_367:
%empty { C($$); }
| module_instantiation_367 ',' hierarchical_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

module_item:
port_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| non_port_module_item
;

module_keyword:
MODULE_ { C($$); T($$, @1, zero, zero); }
| MACROMODULE_ { C($$); T($$, @1, zero, zero); }
;

module_nonansi_header:
module_nonansi_header_8 module_keyword module_nonansi_header_9 module_identifier module_nonansi_header_10 module_nonansi_header_11 list_of_ports ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

module_nonansi_header_10:
%empty { C($$); }
| module_nonansi_header_10 package_import_declaration { $$ = $1; P($$, $2); }
;

module_nonansi_header_11:
%empty { C($$); }
| parameter_port_list
;

module_nonansi_header_8:
%empty /* { C($$); } -- ignore */
| module_nonansi_header_8 attribute_instance { $$ = $1; P($$, $2); }
;

module_nonansi_header_9:
%empty { C($$); }
| lifetime
;

module_or_generate_item:
module_or_generate_item_86 parameter_override { $$ = $1; P($$, $2); }
| module_or_generate_item_87 gate_instantiation { $$ = $1; P($$, $2); }
| module_or_generate_item_88 udp_instantiation { $$ = $1; P($$, $2); }
| module_or_generate_item_89 module_instantiation { $$ = $1; P($$, $2); }
| module_or_generate_item_90 module_common_item { $$ = $1; P($$, $2); }
;

module_or_generate_item_86:
%empty { C($$); }
| module_or_generate_item_86 attribute_instance { $$ = $1; P($$, $2); }
;

module_or_generate_item_87:
%empty { C($$); }
| module_or_generate_item_87 attribute_instance { $$ = $1; P($$, $2); }
;

module_or_generate_item_88:
%empty { C($$); }
| module_or_generate_item_88 attribute_instance { $$ = $1; P($$, $2); }
;

module_or_generate_item_89:
%empty /* { C($$); } -- ignore */
| module_or_generate_item_89 attribute_instance { $$ = $1; P($$, $2); }
;

module_or_generate_item_90:
%empty { C($$); }
| module_or_generate_item_90 attribute_instance { $$ = $1; P($$, $2); }
;

module_or_generate_item_declaration:
package_or_generate_item_declaration
| genvar_declaration
| clocking_declaration
| DEFAULT_ CLOCKING_ clocking_identifier ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| DEFAULT_ DISABLE_ IFF_ expression_or_dist ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

module_path_concatenation:
'{' module_path_expression module_path_concatenation_511 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

module_path_concatenation_511:
%empty { C($$); }
| module_path_concatenation_511 ',' module_path_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

module_path_conditional_expression:
module_path_expression '?' module_path_conditional_expression_538 module_path_expression ':' module_path_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

module_path_conditional_expression_538:
%empty { C($$); }
| module_path_conditional_expression_538 attribute_instance { $$ = $1; P($$, $2); }
;

module_path_expression:
module_path_primary
| unary_module_path_operator module_path_expression_539 module_path_primary { $$ = $1; P($$, $2); P($$, $3); }
| module_path_expression binary_module_path_operator module_path_expression_540 module_path_expression { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| module_path_conditional_expression
;

module_path_expression_539:
%empty { C($$); }
| module_path_expression_539 attribute_instance { $$ = $1; P($$, $2); }
;

module_path_expression_540:
%empty { C($$); }
| module_path_expression_540 attribute_instance { $$ = $1; P($$, $2); }
;

module_path_mintypmax_expression:
module_path_expression
| module_path_expression ':' module_path_expression ':' module_path_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

module_path_multiple_concatenation:
'{' constant_expression module_path_concatenation '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

module_path_primary:
number
| identifier /* ignore */
| module_path_concatenation
| module_path_multiple_concatenation
| function_subroutine_call /* ignore */
| '(' module_path_mintypmax_expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

mos_switch_instance:
cmos_switch_instance_364 '(' output_terminal ',' input_terminal ',' enable_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); }
;

mos_switchtype:
NMOS_ { C($$); T($$, @1, zero, zero); }
| PMOS_ { C($$); T($$, @1, zero, zero); }
| RNMOS_ { C($$); T($$, @1, zero, zero); }
| RPMOS_ { C($$); T($$, @1, zero, zero); }
;

multiple_concatenation:
'{' expression concatenation '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

n_input_gate_instance:
cmos_switch_instance_364 '(' output_terminal ',' input_terminal n_input_gate_instance_365 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

n_input_gate_instance_365:
%empty { C($$); }
| n_input_gate_instance_365 ',' input_terminal { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

n_input_gatetype:
AND_ { C($$); T($$, @1, zero, zero); }
| NAND_ { C($$); T($$, @1, zero, zero); }
| OR_ { C($$); T($$, @1, zero, zero); }
| NOR_ { C($$); T($$, @1, zero, zero); }
| XOR_ { C($$); T($$, @1, zero, zero); }
| XNOR_ { C($$); T($$, @1, zero, zero); }
;

n_output_gate_instance:
cmos_switch_instance_364 '(' output_terminal n_output_gate_instance_366 ',' input_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

n_output_gate_instance_366:
%empty { C($$); }
| n_output_gate_instance_366 ',' output_terminal { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

n_output_gatetype:
BUF_ { C($$); T($$, @1, zero, zero); }
| NOT_ { C($$); T($$, @1, zero, zero); }
;

name_of_instance:
instance_identifier name_of_instance_373 { $$ = $1; P($$, $2); }
;

name_of_instance_373:
%empty { C($$); }
| name_of_instance_373 unpacked_dimension { $$ = $1; P($$, $2); }
;

named_checker_port_connection:
named_checker_port_connection_386 '.' formal_port_identifier named_checker_port_connection_387 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
| named_checker_port_connection_388 DOTS { $$ = $1; T($$, @2, zero, zero); }
;

named_checker_port_connection_386:
%empty { C($$); }
| named_checker_port_connection_386 attribute_instance { $$ = $1; P($$, $2); }
;

named_checker_port_connection_387:
%empty { C($$); }
| '(' property_list_of_arguments_263 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

named_checker_port_connection_388:
%empty { C($$); }
| named_checker_port_connection_388 attribute_instance { $$ = $1; P($$, $2); }
;

named_parameter_assignment:
'.' parameter_identifier '(' named_parameter_assignment_371 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

named_parameter_assignment_371:
%empty { C($$); }
| param_expression
;

named_port_connection:
named_port_connection_377 '.' port_identifier named_port_connection_378 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
| named_port_connection_379 DOTS { $$ = $1; T($$, @2, zero, zero); }
;

named_port_connection_377:
%empty { C($$); }
| named_port_connection_377 attribute_instance { $$ = $1; P($$, $2); }
;

named_port_connection_378:
%empty { C($$); }
| '(' ansi_port_declaration_81 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

named_port_connection_379:
%empty { C($$); }
| named_port_connection_379 attribute_instance { $$ = $1; P($$, $2); }
;

ncontrol_terminal:
expression
;

net_alias:
ALIAS_ net_lvalue '=' net_lvalue net_alias_419 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

net_alias_419:
%empty { C($$); }
| net_alias_419 '=' net_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

net_assignment:
net_lvalue '=' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

net_decl_assignment:
net_identifier net_decl_assignment_214 list_of_tf_variable_identifiers_203 { $$ = $1; P($$, $2); P($$, $3); }
;

net_decl_assignment_214:
%empty { C($$); }
| net_decl_assignment_214 unpacked_dimension { $$ = $1; P($$, $2); }
;

net_declaration:
net_type net_declaration_157 net_declaration_158 data_type_or_implicit net_declaration_159 list_of_net_decl_assignments ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
| net_type_identifier net_declaration_160 list_of_net_decl_assignments ';' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| INTERCONNECT_ implicit_data_type net_declaration_161 net_identifier net_declaration_162 net_declaration_163 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

net_declaration_157:
%empty { C($$); }
| drive_strength
| charge_strength
;

net_declaration_158:
%empty { C($$); }
| VECTORED_ { C($$); T($$, @1, zero, zero); }
| SCALARED_ { C($$); T($$, @1, zero, zero); }
;

net_declaration_159:
%empty { C($$); }
| delay3
;

net_declaration_160:
%empty { C($$); }
| delay_control
;

net_declaration_161:
%empty { C($$); }
| '#' delay_value { C($$); T($$, @1, zero, zero); P($$, $2); }
;

net_declaration_162:
%empty { C($$); }
| net_declaration_162 unpacked_dimension { $$ = $1; P($$, $2); }
;

net_declaration_163:
%empty { C($$); }
| ',' net_identifier net_declaration_163_163 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

net_declaration_163_163:
%empty { C($$); }
| net_declaration_163_163 unpacked_dimension { $$ = $1; P($$, $2); }
;

net_identifier:
identifier
;

net_lvalue:
ps_or_hierarchical_net_identifier constant_select { $$ = $1; P($$, $2); }
| '{' net_lvalue net_lvalue_554 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| assignment_pattern_expression_453 assignment_pattern_net_lvalue { $$ = $1; P($$, $2); }
;

net_lvalue_554:
%empty { C($$); }
| net_lvalue_554 ',' net_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

net_port_header:
net_port_header_74 net_port_type { $$ = $1; P($$, $2); }
;

net_port_header_74:
%empty { C($$); }
| port_direction
;

net_port_type:
net_port_type_184 data_type_or_implicit { $$ = $1; P($$, $2); }
| net_type_identifier
| INTERCONNECT_ implicit_data_type { C($$); T($$, @1, zero, zero); P($$, $2); }
;

net_port_type_184:
%empty { C($$); }
| net_type
;

net_type:
SUPPLY0_ { C($$); T($$, @1, zero, zero); }
| SUPPLY1_ { C($$); T($$, @1, zero, zero); }
| TRI_ { C($$); T($$, @1, zero, zero); }
| TRIAND_ { C($$); T($$, @1, zero, zero); }
| TRIOR_ { C($$); T($$, @1, zero, zero); }
| TRIREG_ { C($$); T($$, @1, zero, zero); }
| TRI0_ { C($$); T($$, @1, zero, zero); }
| TRI1_ { C($$); T($$, @1, zero, zero); }
| UWIRE_ { C($$); T($$, @1, zero, zero); }
| WIRE_ { C($$); T($$, @1, zero, zero); }
| WAND_ { C($$); T($$, @1, zero, zero); }
| WOR_ { C($$); T($$, @1, zero, zero); }
;

net_type_declaration:
NETTYPE_ data_type net_type_identifier net_type_declaration_167 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| NETTYPE_ net_type_declaration_167_167 net_type_identifier net_type_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

net_type_declaration_167:
%empty { C($$); }
| WITH_ net_type_declaration_167_167 tf_identifier { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

net_type_declaration_167_167:
%empty /* { C($$); } -- ignore */
| package_scope
| class_scope
;

net_type_identifier:
identifier
;

next_state:
output_symbol
| '-' { C($$); T($$, @1, zero, zero); }
;

nochange_timing_check:
Dnochange '(' reference_event ',' data_event ',' start_edge_offset ',' end_edge_offset setup_timing_check_490 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

non_consecutive_repetition:
OSBE const_or_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

non_integer_type:
SHORTREAL_ { C($$); T($$, @1, zero, zero); }
| REAL_ { C($$); T($$, @1, zero, zero); }
| REALTIME_ { C($$); T($$, @1, zero, zero); }
;

non_port_interface_item:
generate_region
| interface_or_generate_item
| program_declaration
| interface_declaration
| timeunits_declaration
;

non_port_module_item:
generate_region
| module_or_generate_item
| specify_block
| non_port_module_item_91 specparam_declaration { $$ = $1; P($$, $2); }
| program_declaration
| module_declaration
| interface_declaration
| timeunits_declaration
;

non_port_module_item_91:
%empty { C($$); }
| non_port_module_item_91 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item:
non_port_program_item_107 continuous_assign { $$ = $1; P($$, $2); }
| non_port_program_item_108 module_or_generate_item_declaration { $$ = $1; P($$, $2); }
| non_port_program_item_109 initial_construct { $$ = $1; P($$, $2); }
| non_port_program_item_110 final_construct { $$ = $1; P($$, $2); }
| non_port_program_item_111 concurrent_assertion_item { $$ = $1; P($$, $2); }
| timeunits_declaration
| program_generate_item
;

non_port_program_item_107:
%empty { C($$); }
| non_port_program_item_107 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item_108:
%empty { C($$); }
| non_port_program_item_108 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item_109:
%empty { C($$); }
| non_port_program_item_109 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item_110:
%empty { C($$); }
| non_port_program_item_110 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item_111:
%empty { C($$); }
| non_port_program_item_111 attribute_instance { $$ = $1; P($$, $2); }
;

nonblocking_assignment:
variable_lvalue LE nonblocking_assignment_421 expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

nonblocking_assignment_421:
%empty { C($$); }
| delay_or_event_control
;

nonrange_select:
nonrange_select_548 bit_select { $$ = $1; P($$, $2); }
;

nonrange_select_548:
%empty { C($$); }
| nonrange_select_548_548 '.' member_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

nonrange_select_548_548:
%empty { C($$); }
| nonrange_select_548_548 '.' member_identifier bit_select { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

nonrange_variable_lvalue:
variable_lvalue_555 hierarchical_variable_identifier nonrange_select { $$ = $1; P($$, $2); P($$, $3); }
;

notifier:
variable_identifier
;

number:
integral_number
| real_number
;

open_range_list:
open_value_range open_range_list_445 { $$ = $1; P($$, $2); }
;

open_range_list_445:
%empty { C($$); }
| open_range_list_445 ',' open_value_range { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

open_value_range:
value_range
;

operator_assignment:
variable_lvalue assignment_operator expression { $$ = $1; P($$, $2); P($$, $3); }
;

opt_dotted_identifier:
%empty { C($$); }
| dotted_identifier
;

ordered_checker_port_connection:
ordered_checker_port_connection_385 property_list_of_arguments_263 { $$ = $1; P($$, $2); }
;

ordered_checker_port_connection_385:
%empty { C($$); }
| ordered_checker_port_connection_385 attribute_instance { $$ = $1; P($$, $2); }
;

ordered_parameter_assignment:
param_expression
;

ordered_port_connection:
ordered_port_connection_376 ansi_port_declaration_81 { $$ = $1; P($$, $2); }
;

ordered_port_connection_376:
%empty { C($$); }
| ordered_port_connection_376 attribute_instance { $$ = $1; P($$, $2); }
;

output_declaration:
OUTPUT_ net_port_type list_of_port_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| OUTPUT_ variable_port_type list_of_variable_port_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

output_identifier:
identifier
| interface_identifier '.' port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

output_port_identifier:
identifier
;

output_symbol:
'0' { C($$); T($$, @1, zero, zero); }
| '1' { C($$); T($$, @1, zero, zero); }
| 'x' { C($$); T($$, @1, zero, zero); }
| 'X' { C($$); T($$, @1, zero, zero); }
;

output_terminal:
net_lvalue
;

overload_declaration:
BIND_ overload_operator FUNCTION_ data_type function_identifier '(' overload_proto_formals ')' ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); T($$, @9, zero, zero); }
;

overload_operator:
'+' { C($$); T($$, @1, zero, zero); }
| PLUSPLUS { C($$); T($$, @1, zero, zero); }
| '-' { C($$); T($$, @1, zero, zero); }
| MM { C($$); T($$, @1, zero, zero); }
| '*' { C($$); T($$, @1, zero, zero); }
| SS { C($$); T($$, @1, zero, zero); }
| '/' { C($$); T($$, @1, zero, zero); }
| '%' { C($$); T($$, @1, zero, zero); }
| EE { C($$); T($$, @1, zero, zero); }
| BANGE { C($$); T($$, @1, zero, zero); }
| '<' { C($$); T($$, @1, zero, zero); }
| LE { C($$); T($$, @1, zero, zero); }
| '>' { C($$); T($$, @1, zero, zero); }
| GE { C($$); T($$, @1, zero, zero); }
| '=' { C($$); T($$, @1, zero, zero); }
;

overload_proto_formals:
data_type overload_proto_formals_250 { $$ = $1; P($$, $2); }
;

overload_proto_formals_250:
%empty { C($$); }
| overload_proto_formals_250 ',' data_type { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

package_declaration:
package_declaration_55 PACKAGE_ module_nonansi_header_9 package_identifier ';' source_text_4 package_declaration_56 ENDPACKAGE_ package_declaration_58 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

package_declaration_55:
%empty { C($$); }
| package_declaration_55 attribute_instance { $$ = $1; P($$, $2); }
;

package_declaration_56:
%empty { C($$); }
| package_declaration_56 package_declaration_56_56 package_item { $$ = $1; P($$, $2); P($$, $3); }
;

package_declaration_56_56:
%empty { C($$); }
| package_declaration_56_56 attribute_instance { $$ = $1; P($$, $2); }
;

package_declaration_58:
%empty { C($$); }
| ':' package_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

package_export_declaration:
EXPORT_ SCCS ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
| EXPORT_ package_import_item package_export_declaration_156 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

package_export_declaration_156:
%empty { C($$); }
| package_export_declaration_156 ',' package_import_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

package_identifier:
identifier
;

package_import_declaration:
IMPORT_ package_import_item package_import_declaration_155 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

package_import_declaration_155:
%empty { C($$); }
| package_import_declaration_155 ',' package_import_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

package_import_item:
package_identifier CC identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| package_identifier CC '*' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

package_item:
package_or_generate_item_declaration
| anonymous_program
| package_export_declaration
| timeunits_declaration
;

package_or_generate_item_declaration:
net_declaration
| data_declaration
| task_declaration
| function_declaration
| checker_declaration
| dpi_import_export
| extern_constraint_declaration
| class_declaration
| class_constructor_declaration
| local_parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| covergroup_declaration
| overload_declaration
| assertion_item_declaration
| ';' { C($$); T($$, @1, zero, zero); }
;

package_scope:
package_identifier CC { $$ = $1; T($$, @2, zero, zero); }
| Dunit CC { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

packed_dimension:
'[' constant_range ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| unsized_dimension
;

par_block:
FORK_ seq_block_423 par_block_426 par_block_427 join_keyword seq_block_423 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

par_block_426:
%empty { C($$); }
| par_block_426 block_item_declaration { $$ = $1; P($$, $2); }
;

par_block_427:
%empty { C($$); }
| par_block_427 statement_or_null { $$ = $1; P($$, $2); }
;

parallel_edge_sensitive_path_description:
'(' event_expression_432 specify_input_terminal_descriptor parallel_path_description_486 EG '(' specify_output_terminal_descriptor parallel_path_description_486 ':' data_source_expression ')' ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

parallel_path_description:
'(' specify_input_terminal_descriptor parallel_path_description_486 EG specify_output_terminal_descriptor ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

parallel_path_description_486:
%empty { C($$); }
| polarity_operator
;

param_assignment:
parameter_identifier param_assignment_215 param_assignment_216 { $$ = $1; P($$, $2); P($$, $3); }
;

param_assignment_215:
%empty { C($$); }
| param_assignment_215 unpacked_dimension { $$ = $1; P($$, $2); }
;

param_assignment_216:
%empty { C($$); }
| '=' constant_param_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

param_expression:
mintypmax_expression
| data_type
| '$' { C($$); T($$, @1, zero, zero); }
;

parameter_declaration:
PARAMETER_ data_type_or_implicit list_of_param_assignments { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| PARAMETER_ TYPE_ list_of_type_assignments { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); }
;

parameter_identifier:
identifier
;

parameter_override:
DEFPARAM_ list_of_defparam_assignments ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

parameter_port_declaration:
parameter_declaration
| local_parameter_declaration
| data_type list_of_param_assignments { $$ = $1; P($$, $2); }
| TYPE_ list_of_type_assignments { C($$); T($$, @1, zero, zero); P($$, $2); }
;

parameter_port_list:
'#' '(' list_of_param_assignments parameter_port_list_60 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| '#' '(' parameter_port_declaration parameter_port_list_61 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| '#' '(' ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

parameter_port_list_60:
%empty { C($$); }
| parameter_port_list_60 ',' parameter_port_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

parameter_port_list_61:
%empty { C($$); }
| parameter_port_list_61 ',' parameter_port_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

parameter_value_assignment:
'#' '(' parameter_value_assignment_368 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

parameter_value_assignment_368:
%empty { C($$); }
| list_of_parameter_assignments
;

part_select_range:
constant_range
| indexed_range
;

pass_en_switchtype:
TRANIF0_ { C($$); T($$, @1, zero, zero); }
| TRANIF1_ { C($$); T($$, @1, zero, zero); }
| RTRANIF1_ { C($$); T($$, @1, zero, zero); }
| RTRANIF0_ { C($$); T($$, @1, zero, zero); }
;

pass_enable_switch_instance:
cmos_switch_instance_364 '(' inout_terminal ',' inout_terminal ',' enable_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); }
;

pass_switch_instance:
cmos_switch_instance_364 '(' inout_terminal ',' inout_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

pass_switchtype:
TRAN_ { C($$); T($$, @1, zero, zero); }
| RTRAN_ { C($$); T($$, @1, zero, zero); }
;

path_declaration:
simple_path_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| edge_sensitive_path_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| state_dependent_path_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
;

path_delay_expression:
constant_mintypmax_expression
;

path_delay_value:
list_of_path_delay_expressions
| '(' list_of_path_delay_expressions ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

pattern:
'.' variable_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| DOTS { C($$); T($$, @1, zero, zero); }
| constant_expression
| TAGGED_ member_identifier pattern_446 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| APOSOCB pattern pattern_447 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| APOSOCB member_identifier ':' pattern pattern_448 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

pattern_446:
%empty { C($$); }
| pattern
;

pattern_447:
%empty { C($$); }
| pattern_447 ',' pattern { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

pattern_448:
%empty { C($$); }
| pattern_448 ',' member_identifier ':' pattern { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

pcontrol_terminal:
expression
;

period_timing_check:
Dperiod '(' controlled_reference_event ',' timing_check_limit setup_timing_check_490 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); T($$, @8, zero, zero); }
;

polarity_operator:
'+' { C($$); T($$, @1, zero, zero); }
| '-' { C($$); T($$, @1, zero, zero); }
;

port:
port_72
| '.' port_identifier '(' port_72 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

port_72:
%empty { C($$); }
| port_expression
;

port_declaration:
port_declaration_67 inout_declaration { $$ = $1; P($$, $2); }
| port_declaration_68 input_declaration { $$ = $1; P($$, $2); }
| port_declaration_69 output_declaration { $$ = $1; P($$, $2); }
| port_declaration_70 ref_declaration { $$ = $1; P($$, $2); }
| port_declaration_71 interface_port_declaration { $$ = $1; P($$, $2); }
;

port_declaration_67:
%empty { C($$); }
| port_declaration_67 attribute_instance { $$ = $1; P($$, $2); }
;

port_declaration_68:
%empty { C($$); }
| port_declaration_68 attribute_instance { $$ = $1; P($$, $2); }
;

port_declaration_69:
%empty { C($$); }
| port_declaration_69 attribute_instance { $$ = $1; P($$, $2); }
;

port_declaration_70:
%empty { C($$); }
| port_declaration_70 attribute_instance { $$ = $1; P($$, $2); }
;

port_declaration_71:
%empty /* { C($$); } -- ignore */
| port_declaration_71 attribute_instance { $$ = $1; P($$, $2); }
;

port_direction:
INPUT_ { C($$); T($$, @1, zero, zero); }
| OUTPUT_ { C($$); T($$, @1, zero, zero); }
| INOUT_ { C($$); T($$, @1, zero, zero); }
| REF_ { C($$); T($$, @1, zero, zero); }
;

port_expression:
port_reference
| '{' port_reference port_expression_73 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

port_expression_73:
%empty { C($$); }
| port_expression_73 ',' port_reference { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

port_identifier:
identifier
;

port_reference:
port_identifier constant_select { $$ = $1; P($$, $2); }
;

primary:
primary_literal
| primary_541 hierarchical_identifier select { $$ = $1; P($$, $2); P($$, $3); }
| empty_queue
| concatenation primary_542 { $$ = $1; P($$, $2); }
| multiple_concatenation primary_542 { $$ = $1; P($$, $2); }
| function_subroutine_call
| let_expression
| '(' mintypmax_expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| cast
| assignment_pattern_expression
| streaming_concatenation
| sequence_method_call
| THIS_ { C($$); T($$, @1, zero, zero); }
| '$' { C($$); T($$, @1, zero, zero); }
| NULL_ { C($$); T($$, @1, zero, zero); }
;

primary_541:
%empty /* { C($$); } -- ignore */
| class_qualifier
| package_scope
;

primary_542:
%empty { C($$); }
| '[' range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

primary_literal:
number
| time_literal
| unbased_unsized_literal
| string_literal
;

procedural_assertion_statement:
concurrent_assertion_statement
| immediate_assertion_statement
| checker_instantiation
;

procedural_continuous_assignment:
ASSIGN_ variable_assignment { C($$); T($$, @1, zero, zero); P($$, $2); }
| DEASSIGN_ variable_lvalue { C($$); T($$, @1, zero, zero); P($$, $2); }
| FORCE_ variable_assignment { C($$); T($$, @1, zero, zero); P($$, $2); }
| FORCE_ net_assignment { C($$); T($$, @1, zero, zero); P($$, $2); }
| RELEASE_ variable_lvalue { C($$); T($$, @1, zero, zero); P($$, $2); }
| RELEASE_ net_lvalue { C($$); T($$, @1, zero, zero); P($$, $2); }
;

procedural_timing_control:
delay_control
| event_control
| cycle_delay
;

procedural_timing_control_statement:
procedural_timing_control statement_or_null { $$ = $1; P($$, $2); }
;

production:
production_473 production_identifier production_474 ':' rs_rule production_475 ';' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

production_473:
%empty /* { C($$); } -- ignore */
| data_type_or_void
;

production_474:
%empty { C($$); }
| '(' tf_port_list ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

production_475:
%empty { C($$); }
| production_475 '|' rs_rule { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

production_identifier:
identifier
;

production_item:
production_identifier class_declaration_44_44 { $$ = $1; P($$, $2); }
;

program_ansi_header:
program_ansi_header_36 PROGRAM_ module_nonansi_header_9 program_identifier program_ansi_header_37 module_nonansi_header_11 module_ansi_header_14 ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

program_ansi_header_36:
%empty { C($$); }
| program_ansi_header_36 attribute_instance { $$ = $1; P($$, $2); }
;

program_ansi_header_37:
%empty { C($$); }
| program_ansi_header_37 package_import_declaration { $$ = $1; P($$, $2); }
;

program_declaration:
program_nonansi_header source_text_4 program_declaration_29 ENDPROGRAM_ program_declaration_30 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| program_ansi_header source_text_4 program_declaration_31 ENDPROGRAM_ program_declaration_30 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| program_declaration_32 PROGRAM_ program_identifier '(' DOTS ')' ';' source_text_4 program_declaration_33 ENDPROGRAM_ program_declaration_30 { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); T($$, @5, zero, zero); T($$, @6, zero, zero); T($$, @7, zero, zero); P($$, $8); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
| EXTERN_ program_nonansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
| EXTERN_ program_ansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
;

program_declaration_29:
%empty { C($$); }
| program_declaration_29 program_item { $$ = $1; P($$, $2); }
;

program_declaration_30:
%empty { C($$); }
| ':' program_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

program_declaration_31:
%empty { C($$); }
| program_declaration_31 non_port_program_item { $$ = $1; P($$, $2); }
;

program_declaration_32:
%empty /* { C($$); } -- ignore */
| program_declaration_32 attribute_instance { $$ = $1; P($$, $2); }
;

program_declaration_33:
%empty { C($$); }
| program_declaration_33 program_item { $$ = $1; P($$, $2); }
;

program_generate_item:
loop_generate_construct
| conditional_generate_construct
| generate_region
| elaboration_system_task
;

program_identifier:
identifier
;

program_instantiation:
program_identifier interface_class_type_50 hierarchical_instance program_instantiation_381 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

program_instantiation_381:
%empty { C($$); }
| program_instantiation_381 ',' hierarchical_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

program_item:
port_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| non_port_program_item
;

program_nonansi_header:
program_nonansi_header_34 PROGRAM_ module_nonansi_header_9 program_identifier program_nonansi_header_35 module_nonansi_header_11 list_of_ports ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

program_nonansi_header_34:
%empty /* { C($$); } -- ignore */
| program_nonansi_header_34 attribute_instance { $$ = $1; P($$, $2); }
;

program_nonansi_header_35:
%empty { C($$); }
| program_nonansi_header_35 package_import_declaration { $$ = $1; P($$, $2); }
;

property_actual_arg:
property_expr
| sequence_actual_arg
;

property_case_item:
expression_or_dist property_case_item_283 ':' property_expr property_declaration_270 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); }
| DEFAULT_ property_case_item_284 property_expr property_declaration_270 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); }
;

property_case_item_283:
%empty { C($$); }
| property_case_item_283 ',' expression_or_dist { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

property_case_item_284:
%empty { C($$); }
| ':' { C($$); T($$, @1, zero, zero); }
;

property_declaration:
PROPERTY_ property_identifier property_declaration_267 ';' property_declaration_269 property_spec property_declaration_270 ENDPROPERTY_ property_declaration_271 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

property_declaration_267:
%empty { C($$); }
| '(' property_declaration_267_267 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

property_declaration_267_267:
%empty { C($$); }
| property_port_list
;

property_declaration_269:
%empty { C($$); }
| property_declaration_269 assertion_variable_declaration { $$ = $1; P($$, $2); }
;

property_declaration_270:
%empty { C($$); }
| ';' { C($$); T($$, @1, zero, zero); }
;

property_declaration_271:
%empty { C($$); }
| ':' property_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

property_expr:
sequence_expr
| STRONG_ '(' sequence_expr ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| WEAK_ '(' sequence_expr ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| '(' property_expr ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| NOT_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| property_expr OR_ property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| property_expr AND_ property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr PIPEMG property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr PIPEEG property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| IF_ '(' expression_or_dist ')' property_expr property_expr_277 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
| CASE_ '(' expression_or_dist ')' property_expr_278 ENDCASE_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
| sequence_expr NMN property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr NEN property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| NEXTTIME_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| NEXTTIME_ property_expr_279 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| S_NEXTTIME_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| S_NEXTTIME_ property_expr_280 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| ALWAYS_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| ALWAYS_ property_expr_281 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| S_ALWAYS_ property_expr_282 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| S_EVENTUALLY_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| EVENTUALLY_ property_expr_282 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| S_EVENTUALLY_ property_expr_281 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| property_expr UNTIL_ property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| property_expr S_UNTIL_ property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| property_expr UNTIL_WITH_ property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| property_expr S_UNTIL_WITH_ property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| property_expr IMPLIES_ property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| property_expr IFF_ property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| ACCEPT_ON_ '(' expression_or_dist ')' property_expr { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| REJECT_ON_ '(' expression_or_dist ')' property_expr { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| SYNC_ACCEPT_ON_ '(' expression_or_dist ')' property_expr { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| SYNC_REJECT_ON_ '(' expression_or_dist ')' property_expr { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| property_instance
| clocking_event property_expr { $$ = $1; P($$, $2); }
;

property_expr_277:
%empty { C($$); }
| ELSE_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
;

property_expr_278:
property_case_item
| property_expr_278 property_case_item { $$ = $1; P($$, $2); }
;

property_expr_279:
%empty { C($$); }
| CONSTANT_ expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

property_expr_280:
%empty { C($$); }
| constant_expression
;

property_expr_281:
%empty { C($$); }
| cycle_delay_const_range_expression
;

property_expr_282:
%empty { C($$); }
| constant_range
;

property_formal_type:
sequence_formal_type
| PROPERTY_ { C($$); T($$, @1, zero, zero); }
;

property_identifier:
identifier
;

property_instance:
ps_or_hierarchical_property_identifier property_instance_261 { $$ = $1; P($$, $2); }
;

property_instance_261:
%empty { C($$); }
| '(' property_instance_261_261 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

property_instance_261_261:
%empty { C($$); }
| property_list_of_arguments
;

property_list_of_arguments:
property_list_of_arguments_263 property_list_of_arguments_264 property_list_of_arguments_265 { $$ = $1; P($$, $2); P($$, $3); }
| '.' identifier '(' property_list_of_arguments_263 ')' property_list_of_arguments_266 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

property_list_of_arguments_263:
%empty { C($$); }
| property_actual_arg
;

property_list_of_arguments_264:
%empty { C($$); }
| property_list_of_arguments_264 ',' property_list_of_arguments_263 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

property_list_of_arguments_265:
%empty { C($$); }
| property_list_of_arguments_265 ',' '.' identifier '(' property_list_of_arguments_263 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

property_list_of_arguments_266:
%empty { C($$); }
| property_list_of_arguments_266 ',' '.' identifier '(' property_list_of_arguments_263 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

property_lvar_port_direction:
INPUT_ { C($$); T($$, @1, zero, zero); }
;

property_port_item:
property_port_item_273 property_port_item_274 property_formal_type formal_port_identifier property_port_item_276 checker_port_item_116 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

property_port_item_273:
%empty { C($$); }
| property_port_item_273 attribute_instance { $$ = $1; P($$, $2); }
;

property_port_item_274:
%empty { C($$); }
| LOCAL_ property_port_item_274_274 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

property_port_item_274_274:
%empty { C($$); }
| property_lvar_port_direction
;

property_port_item_276:
%empty { C($$); }
| property_port_item_276 variable_dimension { $$ = $1; P($$, $2); }
;

property_port_list:
property_port_item property_port_list_272 { $$ = $1; P($$, $2); }
;

property_port_list_272:
%empty { C($$); }
| property_port_list_272 ',' property_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

property_qualifier:
random_qualifier
| class_item_qualifier
;

property_spec:
cover_sequence_statement_259 cover_sequence_statement_260 property_expr { $$ = $1; P($$, $2); P($$, $3); }
;

ps_checker_identifier:
ps_identifier
;

ps_class_identifier:
ps_identifier
;

ps_covergroup_identifier:
ps_identifier /* ignore */
;

ps_identifier:
identifier
| package_identifier CC identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| Dunit CC identifier { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); }
;

ps_or_hierarchical_array_identifier:
blocking_assignment_420 hierarchical_array_identifier { $$ = $1; P($$, $2); }
;

ps_or_hierarchical_net_identifier:
let_expression_314 net_identifier { $$ = $1; P($$, $2); }
| hierarchical_net_identifier
;

ps_or_hierarchical_property_identifier:
let_expression_314 property_identifier { $$ = $1; P($$, $2); }
| hierarchical_property_identifier
;

ps_or_hierarchical_sequence_identifier:
let_expression_314 sequence_identifier { $$ = $1; P($$, $2); }
| hierarchical_sequence_identifier
;

ps_or_hierarchical_tf_identifier:
let_expression_314 tf_identifier { $$ = $1; P($$, $2); }
| hierarchical_tf_identifier
;

ps_parameter_identifier:
net_type_declaration_167_167 parameter_identifier { $$ = $1; P($$, $2); }
| ps_parameter_identifier_560 parameter_identifier { $$ = $1; P($$, $2); }
;

ps_parameter_identifier_560:
%empty /* { C($$); } -- ignore */
| ps_parameter_identifier_560 generate_block_identifier ps_parameter_identifier_560_560 '.' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

ps_parameter_identifier_560_560:
%empty { C($$); }
| '[' constant_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

ps_type_identifier:
type_identifier
| localCC type_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| package_scope type_identifier { $$ = $1; P($$, $2); }
;

ps_type_identifier_562:
%empty /* { C($$); } -- ignore */
| localCC /* { C($$); T($$, @1, zero, zero); } -- ignore */
| package_scope /* ignore */
;

pull_gate_instance:
cmos_switch_instance_364 '(' output_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

pulldown_strength:
'(' strength0 ',' strength1 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' strength1 ',' strength0 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' strength0 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

pullup_strength:
'(' strength0 ',' strength1 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' strength1 ',' strength0 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' strength1 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

pulse_control_specparam:
PATHPULSED '=' '(' reject_limit_value pulse_control_specparam_218 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| PATHPULSED specify_input_terminal_descriptor '$' specify_output_terminal_descriptor '=' '(' reject_limit_value pulse_control_specparam_218 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); }
;

pulse_control_specparam_218:
%empty { C($$); }
| ',' error_limit_value { C($$); T($$, @1, zero, zero); P($$, $2); }
;

pulsestyle_declaration:
PULSESTYLE_ONEVENT_ list_of_path_outputs ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| PULSESTYLE_ONDETECT_ list_of_path_outputs ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

queue_dimension:
'[' '$' queue_dimension_224 ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

queue_dimension_224:
%empty { C($$); }
| ':' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

randcase_item:
expression ':' statement_or_null { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

randcase_statement:
RANDCASE_ randcase_statement_444 ENDCASE_ { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

randcase_statement_444:
randcase_item
| randcase_statement_444 randcase_item { $$ = $1; P($$, $2); }
;

random_qualifier:
RAND_ { C($$); T($$, @1, zero, zero); }
| RANDC_ { C($$); T($$, @1, zero, zero); }
;

randomize_call:
RANDOMIZE_ randomize_call_524 randomize_call_525 randomize_call_527 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); }
;

randomize_call_524:
%empty { C($$); }
| randomize_call_524 attribute_instance { $$ = $1; P($$, $2); }
;

randomize_call_525:
%empty { C($$); }
| '(' randomize_call_525_525 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

randomize_call_525_525:
%empty { C($$); }
| variable_identifier_list
| NULL_ { C($$); T($$, @1, zero, zero); }
;

randomize_call_527:
%empty { C($$); }
| WITH_ randomize_call_527_527 constraint_block { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

randomize_call_527_527:
%empty { C($$); }
| '(' randomize_call_527_527_527 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

randomize_call_527_527_527:
%empty { C($$); }
| identifier_list
;

randsequence_statement:
RANDSEQUENCE_ '(' randsequence_statement_471 ')' randsequence_statement_472 ENDSEQUENCE_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

randsequence_statement_471:
%empty { C($$); }
| production_identifier
;

randsequence_statement_472:
production
| randsequence_statement_472 production { $$ = $1; P($$, $2); }
;

range_expression:
expression
| part_select_range
;

real_number:
REAL_NUMBER_ { C($$); T($$, @1, zero, zero); }
;

recovery_timing_check:
Drecovery '(' reference_event ',' data_event ',' timing_check_limit setup_timing_check_490 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

recrem_timing_check:
Drecrem '(' reference_event ',' data_event ',' timing_check_limit ',' timing_check_limit setuphold_timing_check_492 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

ref_declaration:
REF_ variable_port_type list_of_variable_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

reference_event:
timing_check_event
;

reject_limit_value:
limit_value
;

remain_active_flag:
constant_mintypmax_expression
;

removal_timing_check:
Dremoval '(' reference_event ',' data_event ',' timing_check_limit setup_timing_check_490 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

repeat_range:
covergroup_expression
| covergroup_expression ':' covergroup_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

restrict_property_statement:
RESTRICT_ PROPERTY_ '(' property_spec ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); }
;

rs_case:
CASE_ '(' case_expression ')' rs_case_483 ENDCASE_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

rs_case_483:
rs_case_item
| rs_case_483 rs_case_item { $$ = $1; P($$, $2); }
;

rs_case_item:
case_item_expression rs_case_item_484 ':' production_item ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| DEFAULT_ property_case_item_284 production_item ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

rs_case_item_484:
%empty { C($$); }
| rs_case_item_484 ',' case_item_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

rs_code_block:
'{' rs_code_block_480 rs_code_block_481 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

rs_code_block_480:
%empty { C($$); }
| rs_code_block_480 data_declaration { $$ = $1; P($$, $2); }
;

rs_code_block_481:
%empty { C($$); }
| rs_code_block_481 statement_or_null { $$ = $1; P($$, $2); }
;

rs_if_else:
IF_ '(' expression ')' production_item rs_if_else_482 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
;

rs_if_else_482:
%empty { C($$); }
| ELSE_ production_item { C($$); T($$, @1, zero, zero); P($$, $2); }
;

rs_prod:
production_item
| rs_code_block
| rs_if_else
| rs_repeat
| rs_case
;

rs_production_list:
rs_production_list_478
| RAND_ JOIN_ dynamic_array_new_223 production_item rs_production_list_479 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

rs_production_list_478:
rs_prod
| rs_production_list_478 rs_prod { $$ = $1; P($$, $2); }
;

rs_production_list_479:
production_item
| rs_production_list_479 production_item { $$ = $1; P($$, $2); }
;

rs_repeat:
REPEAT_ '(' expression ')' production_item { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

rs_rule:
rs_production_list rs_rule_476 { $$ = $1; P($$, $2); }
;

rs_rule_476:
%empty { C($$); }
| CE weight_specification rs_rule_476_476 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

rs_rule_476_476:
%empty { C($$); }
| rs_code_block
;

scalar_constant:
_1APOSb0 { C($$); T($$, @1, zero, zero); }
| _1APOSb1 { C($$); T($$, @1, zero, zero); }
| _1APOSB0 { C($$); T($$, @1, zero, zero); }
| _1APOSB1 { C($$); T($$, @1, zero, zero); }
| APOSb0 { C($$); T($$, @1, zero, zero); }
| APOSb1 { C($$); T($$, @1, zero, zero); }
| APOSB0 { C($$); T($$, @1, zero, zero); }
| APOSB1 { C($$); T($$, @1, zero, zero); }
| '1' { C($$); T($$, @1, zero, zero); }
| '0' { C($$); T($$, @1, zero, zero); }
;

scalar_timing_check_condition:
expression
| '~' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
| expression EE scalar_constant { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression EEE scalar_constant { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression BANGE scalar_constant { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression BANGEE scalar_constant { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

select:
select_545 bit_select select_547 { $$ = $1; P($$, $2); P($$, $3); }
;

select_545:
%empty { C($$); }
| select_545_545 '.' member_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

select_545_545:
%empty { C($$); }
| select_545_545 '.' member_identifier bit_select { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

select_547:
%empty { C($$); }
| '[' part_select_range ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

select_condition:
BINSOF_ '(' bins_expression ')' select_condition_348 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

select_condition_348:
%empty { C($$); }
| INTERSECT_ '{' covergroup_range_list '}' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

select_expression:
select_condition
| '!' select_condition { C($$); T($$, @1, zero, zero); P($$, $2); }
| select_expression AMPAMP select_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| select_expression PIPEPIPE select_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| '(' select_expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| select_expression WITH_ '(' with_covergroup_expression ')' select_expression_347 { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| cross_identifier
| cross_set_expression select_expression_347 { $$ = $1; P($$, $2); }
;

select_expression_347:
%empty { C($$); }
| MATCHES_ integer_covergroup_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

seq_block:
BEGIN_ seq_block_423 seq_block_424 seq_block_425 END_ seq_block_423 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

seq_block_423:
%empty { C($$); }
| ':' block_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

seq_block_424:
%empty { C($$); }
| seq_block_424 block_item_declaration { $$ = $1; P($$, $2); }
;

seq_block_425:
%empty { C($$); }
| seq_block_425 statement_or_null { $$ = $1; P($$, $2); }
;

seq_input_list:
edge_indicator level_symbol_0n { $$ = $1; P($$, $2); }
| level_symbol level_symbol_0n { $$ = $1; P($$, $2); }
| level_symbol edge_indicator level_symbol_0n { $$ = $1; P($$, $2); P($$, $3); }
;

sequence_abbrev:
consecutive_repetition
;

sequence_actual_arg:
event_expression
| sequence_expr
;

sequence_declaration:
SEQUENCE_ sequence_identifier sequence_declaration_285 ';' sequence_declaration_287 sequence_expr property_declaration_270 ENDSEQUENCE_ sequence_declaration_288 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

sequence_declaration_285:
%empty { C($$); }
| '(' sequence_declaration_285_285 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

sequence_declaration_285_285:
%empty { C($$); }
| sequence_port_list
;

sequence_declaration_287:
%empty { C($$); }
| sequence_declaration_287 assertion_variable_declaration { $$ = $1; P($$, $2); }
;

sequence_declaration_288:
%empty { C($$); }
| ':' sequence_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

sequence_expr:
cycle_delay_range sequence_expr sequence_expr_295 { $$ = $1; P($$, $2); P($$, $3); }
| sequence_expr cycle_delay_range sequence_expr sequence_expr_296 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| expression_or_dist sequence_expr_297 { $$ = $1; P($$, $2); }
| sequence_instance sequence_expr_298 { $$ = $1; P($$, $2); }
| '(' sequence_expr sequence_expr_299 ')' sequence_expr_298 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| sequence_expr AND_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr INTERSECT_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr OR_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| FIRST_MATCH_ '(' sequence_expr sequence_expr_300 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| expression_or_dist THROUGHOUT_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr WITHIN_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| clocking_event sequence_expr { $$ = $1; P($$, $2); }
;

sequence_expr_295:
%empty { C($$); }
| sequence_expr_295 cycle_delay_range sequence_expr { $$ = $1; P($$, $2); P($$, $3); }
;

sequence_expr_296:
%empty { C($$); }
| sequence_expr_296 cycle_delay_range sequence_expr { $$ = $1; P($$, $2); P($$, $3); }
;

sequence_expr_297:
%empty { C($$); }
| boolean_abbrev
;

sequence_expr_298:
%empty { C($$); }
| sequence_abbrev
;

sequence_expr_299:
%empty { C($$); }
| sequence_expr_299 ',' sequence_match_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequence_expr_300:
%empty { C($$); }
| sequence_expr_300 ',' sequence_match_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequence_formal_type:
data_type_or_implicit
| SEQUENCE_ { C($$); T($$, @1, zero, zero); }
| UNTYPED_ { C($$); T($$, @1, zero, zero); }
;

sequence_identifier:
identifier
;

sequence_instance:
ps_or_hierarchical_sequence_identifier sequence_instance_301 { $$ = $1; P($$, $2); }
;

sequence_instance_301:
%empty { C($$); }
| '(' sequence_instance_301_301 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

sequence_instance_301_301:
%empty { C($$); }
| sequence_list_of_arguments
;

sequence_list_of_arguments:
sequence_list_of_arguments_303 sequence_list_of_arguments_304 sequence_list_of_arguments_305 { $$ = $1; P($$, $2); P($$, $3); }
| '.' identifier '(' sequence_list_of_arguments_303 ')' sequence_list_of_arguments_306 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

sequence_list_of_arguments_303:
%empty { C($$); }
| sequence_actual_arg
;

sequence_list_of_arguments_304:
%empty { C($$); }
| sequence_list_of_arguments_304 ',' sequence_list_of_arguments_303 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequence_list_of_arguments_305:
%empty { C($$); }
| sequence_list_of_arguments_305 ',' '.' identifier '(' sequence_list_of_arguments_303 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

sequence_list_of_arguments_306:
%empty { C($$); }
| sequence_list_of_arguments_306 ',' '.' identifier '(' sequence_list_of_arguments_303 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

sequence_lvar_port_direction:
INPUT_ { C($$); T($$, @1, zero, zero); }
| INOUT_ { C($$); T($$, @1, zero, zero); }
| OUTPUT_ { C($$); T($$, @1, zero, zero); }
;

sequence_match_item:
operator_assignment
| inc_or_dec_expression
| subroutine_call
;

sequence_method_call:
sequence_instance '.' method_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequence_port_item:
sequence_port_item_290 sequence_port_item_291 sequence_formal_type formal_port_identifier sequence_port_item_293 sequence_port_item_294 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

sequence_port_item_290:
%empty { C($$); }
| sequence_port_item_290 attribute_instance { $$ = $1; P($$, $2); }
;

sequence_port_item_291:
%empty { C($$); }
| LOCAL_ sequence_port_item_291_291 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

sequence_port_item_291_291:
%empty { C($$); }
| sequence_lvar_port_direction
;

sequence_port_item_293:
%empty { C($$); }
| sequence_port_item_293 variable_dimension { $$ = $1; P($$, $2); }
;

sequence_port_item_294:
%empty { C($$); }
| '=' sequence_actual_arg { C($$); T($$, @1, zero, zero); P($$, $2); }
;

sequence_port_list:
sequence_port_item sequence_port_list_289 { $$ = $1; P($$, $2); }
;

sequence_port_list_289:
%empty { C($$); }
| sequence_port_list_289 ',' sequence_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequential_body:
sequential_body_410 TABLE_ sequential_body_411 ENDTABLE_ { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

sequential_body_410:
%empty { C($$); }
| udp_initial_statement
;

sequential_body_411:
sequential_entry
| sequential_body_411 sequential_entry { $$ = $1; P($$, $2); }
;

sequential_entry:
seq_input_list ':' current_state ':' next_state ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
| seq_input_list ':' output_symbol ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

set_covergroup_expression:
covergroup_expression
;

setup_timing_check:
Dsetup '(' data_event ',' reference_event ',' timing_check_limit setup_timing_check_490 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

setup_timing_check_490:
%empty { C($$); }
| ',' setup_timing_check_490_490 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

setup_timing_check_490_490:
%empty { C($$); }
| notifier
;

setuphold_timing_check:
Dsetuphold '(' reference_event ',' data_event ',' timing_check_limit ',' timing_check_limit setuphold_timing_check_492 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

setuphold_timing_check_492:
%empty { C($$); }
| ',' setup_timing_check_490_490 setuphold_timing_check_492_492 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

setuphold_timing_check_492_492:
%empty { C($$); }
| ',' setuphold_timing_check_492_492_492 setuphold_timing_check_492_492_493 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

setuphold_timing_check_492_492_492:
%empty { C($$); }
| timestamp_condition
;

setuphold_timing_check_492_492_493:
%empty { C($$); }
| ',' setuphold_timing_check_492_492_493_493 setuphold_timing_check_492_492_493_494 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

setuphold_timing_check_492_492_493_493:
%empty { C($$); }
| timecheck_condition
;

setuphold_timing_check_492_492_493_494:
%empty { C($$); }
| ',' setuphold_timing_check_492_492_493_494_494 setuphold_timing_check_492_492_493_494_495 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

setuphold_timing_check_492_492_493_494_494:
%empty { C($$); }
| delayed_reference
;

setuphold_timing_check_492_492_493_494_495:
%empty { C($$); }
| ',' setuphold_timing_check_492_492_493_494_495_495 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

setuphold_timing_check_492_492_493_494_495_495:
%empty { C($$); }
| delayed_data
;

showcancelled_declaration:
SHOWCANCELLED_ list_of_path_outputs ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| NOSHOWCANCELLED_ list_of_path_outputs ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

signal_identifier:
identifier
;

signing:
SIGNED_ { C($$); T($$, @1, zero, zero); }
| UNSIGNED_ { C($$); T($$, @1, zero, zero); }
;

simple_identifier:
CID_ { C($$); T($$, @1, zero, zero); }
| SID_ { C($$); T($$, @1, zero, zero); }
;

simple_immediate_assert_statement:
ASSERT_ '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

simple_immediate_assertion_statement:
simple_immediate_assert_statement
| simple_immediate_assume_statement
| simple_immediate_cover_statement
;

simple_immediate_assume_statement:
ASSUME_ '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

simple_immediate_cover_statement:
COVER_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

simple_path_declaration:
parallel_path_description '=' path_delay_value { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| full_path_description '=' path_delay_value { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

simple_type:
integer_type
| non_integer_type
| ps_type_identifier
| ps_parameter_identifier
;

skew_timing_check:
Dskew '(' reference_event ',' data_event ',' timing_check_limit setup_timing_check_490 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

slice_size:
simple_type
| constant_expression
;

solve_before_list:
constraint_primary solve_before_list_141 { $$ = $1; P($$, $2); }
;

solve_before_list_141:
%empty { C($$); }
| solve_before_list_141 ',' constraint_primary { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

source_text:
source_text_4 source_text_5 { $$ = $1; P($$, $2); }
;

source_text_4:
%empty { C($$); }
| timeunits_declaration
;

source_text_5:
%empty { C($$); }
| source_text_5 description { $$ = $1; P($$, $2); }
;

specify_block:
SPECIFY_ specify_block_485 ENDSPECIFY_ { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

specify_block_485:
%empty { C($$); }
| specify_block_485 specify_item { $$ = $1; P($$, $2); }
;

specify_input_terminal_descriptor:
input_identifier specify_input_terminal_descriptor_489 { $$ = $1; P($$, $2); }
;

specify_input_terminal_descriptor_489:
%empty { C($$); }
| '[' constant_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

specify_item:
specparam_declaration
| pulsestyle_declaration
| showcancelled_declaration
| path_declaration
| system_timing_check
;

specify_output_terminal_descriptor:
output_identifier specify_input_terminal_descriptor_489 { $$ = $1; P($$, $2); }
;

specify_terminal_descriptor:
specify_input_terminal_descriptor
| specify_output_terminal_descriptor
;

specparam_assignment:
specparam_identifier '=' constant_mintypmax_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| pulse_control_specparam
;

specparam_declaration:
SPECPARAM_ specparam_declaration_152 list_of_specparam_assignments ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

specparam_declaration_152:
%empty { C($$); }
| packed_dimension
;

specparam_identifier:
identifier
;

start_edge_offset:
mintypmax_expression
;

state_dependent_path_declaration:
IF_ '(' module_path_expression ')' simple_path_declaration { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| IF_ '(' module_path_expression ')' edge_sensitive_path_declaration { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| IFNONE_ simple_path_declaration { C($$); T($$, @1, zero, zero); P($$, $2); }
;

statement:
concurrent_assertion_item_258 statement_429 statement_item { $$ = $1; P($$, $2); P($$, $3); }
;

statement_429:
%empty { C($$); }
| statement_429 attribute_instance { $$ = $1; P($$, $2); }
;

statement_item:
blocking_assignment ';' { $$ = $1; T($$, @2, zero, zero); }
| nonblocking_assignment ';' { $$ = $1; T($$, @2, zero, zero); }
| procedural_continuous_assignment ';' { $$ = $1; T($$, @2, zero, zero); }
| case_statement
| conditional_statement
| inc_or_dec_expression ';' { $$ = $1; T($$, @2, zero, zero); }
| subroutine_call_statement
| disable_statement
| event_trigger
| loop_statement
| jump_statement
| par_block
| procedural_timing_control_statement
| seq_block
| wait_statement
| procedural_assertion_statement
| clocking_drive ';' { $$ = $1; T($$, @2, zero, zero); }
| randsequence_statement
| randcase_statement
| expect_property_statement
;

statement_or_null:
statement
| statement_or_null_428 ';' { $$ = $1; T($$, @2, zero, zero); }
;

statement_or_null_428:
%empty { C($$); }
| statement_or_null_428 attribute_instance { $$ = $1; P($$, $2); }
;

stream_concatenation:
'{' stream_expression stream_concatenation_513 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

stream_concatenation_513:
%empty { C($$); }
| stream_concatenation_513 ',' stream_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

stream_expression:
expression stream_expression_514 { $$ = $1; P($$, $2); }
;

stream_expression_514:
%empty { C($$); }
| WITH_ '[' array_range_expression ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

stream_operator:
GG { C($$); T($$, @1, zero, zero); }
| LL { C($$); T($$, @1, zero, zero); }
;

streaming_concatenation:
'{' stream_operator streaming_concatenation_512 stream_concatenation '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

streaming_concatenation_512:
%empty /* { C($$); } -- ignore */
| slice_size
;

strength0:
SUPPLY0_ { C($$); T($$, @1, zero, zero); }
| STRONG0_ { C($$); T($$, @1, zero, zero); }
| PULL0_ { C($$); T($$, @1, zero, zero); }
| WEAK0_ { C($$); T($$, @1, zero, zero); }
;

strength1:
SUPPLY1_ { C($$); T($$, @1, zero, zero); }
| STRONG1_ { C($$); T($$, @1, zero, zero); }
| PULL1_ { C($$); T($$, @1, zero, zero); }
| WEAK1_ { C($$); T($$, @1, zero, zero); }
;

string_literal:
STRING { C($$); T($$, @1, zero, zero); }
;

struct_union:
STRUCT_ { C($$); T($$, @1, zero, zero); }
| UNION_ struct_union_187 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

struct_union_187:
%empty { C($$); }
| TAGGED_ { C($$); T($$, @1, zero, zero); }
;

struct_union_member:
struct_union_member_185 struct_union_member_186 data_type_or_void list_of_variable_decl_assignments ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

struct_union_member_185:
%empty { C($$); }
| struct_union_member_185 attribute_instance { $$ = $1; P($$, $2); }
;

struct_union_member_186:
%empty { C($$); }
| random_qualifier
;

structure_pattern_key:
member_identifier
| assignment_pattern_key
;

subroutine_call:
tf_call
| system_tf_call
| method_call
| subroutine_call_517 randomize_call { $$ = $1; P($$, $2); }
;

subroutine_call_517:
%empty { C($$); }
| stdCC { C($$); T($$, @1, zero, zero); }
;

subroutine_call_statement:
subroutine_call ';' { $$ = $1; T($$, @2, zero, zero); }
| VOID_ '\'' '(' function_subroutine_call ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); }
;

system_tf_call:
system_tf_identifier class_declaration_44_44 { $$ = $1; P($$, $2); }
| system_tf_identifier '(' data_type system_tf_call_516 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

system_tf_call_516:
%empty { C($$); }
| ',' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

system_tf_identifier:
SYSID_ { C($$); T($$, @1, zero, zero); }
;

system_timing_check:
setup_timing_check
| hold_timing_check
| setuphold_timing_check
| recovery_timing_check
| removal_timing_check
| recrem_timing_check
| skew_timing_check
| timeskew_timing_check
| fullskew_timing_check
| period_timing_check
| width_timing_check
| nochange_timing_check
;

t_path_delay_expression:
path_delay_expression
;

t01_path_delay_expression:
path_delay_expression
;

t0x_path_delay_expression:
path_delay_expression
;

t0z_path_delay_expression:
path_delay_expression
;

t10_path_delay_expression:
path_delay_expression
;

t1x_path_delay_expression:
path_delay_expression
;

t1z_path_delay_expression:
path_delay_expression
;

tagged_union_expression:
TAGGED_ member_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| TAGGED_ member_identifier expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

task_body_declaration:
function_body_declaration_225 task_identifier ';' task_body_declaration_234 task_body_declaration_235 ENDTASK_ task_body_declaration_236 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); P($$, $7); }
| function_body_declaration_225 task_identifier '(' class_constructor_prototype_131_131 ')' ';' task_body_declaration_237 task_body_declaration_238 ENDTASK_ task_body_declaration_236 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); P($$, $10); }
;

task_body_declaration_234:
%empty { C($$); }
| task_body_declaration_234 tf_item_declaration { $$ = $1; P($$, $2); }
;

task_body_declaration_235:
%empty { C($$); }
| task_body_declaration_235 statement_or_null { $$ = $1; P($$, $2); }
;

task_body_declaration_236:
%empty { C($$); }
| ':' task_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

task_body_declaration_237:
%empty { C($$); }
| task_body_declaration_237 block_item_declaration { $$ = $1; P($$, $2); }
;

task_body_declaration_238:
%empty { C($$); }
| task_body_declaration_238 statement_or_null { $$ = $1; P($$, $2); }
;

task_declaration:
TASK_ module_nonansi_header_9 task_body_declaration { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

task_identifier:
identifier
;

task_prototype:
TASK_ task_identifier class_constructor_prototype_131 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

terminal_identifier:
identifier
;

tf_call:
ps_or_hierarchical_tf_identifier tf_call_515 class_declaration_44_44 { $$ = $1; P($$, $2); P($$, $3); }
;

tf_call_515:
%empty { C($$); }
| tf_call_515 attribute_instance { $$ = $1; P($$, $2); }
;

tf_identifier:
identifier
;

tf_item_declaration:
block_item_declaration
| tf_port_declaration
;

tf_port_declaration:
tf_port_declaration_244 tf_port_direction data_declaration_154 data_type_or_implicit list_of_tf_variable_identifiers ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

tf_port_declaration_244:
%empty { C($$); }
| tf_port_declaration_244 attribute_instance { $$ = $1; P($$, $2); }
;

tf_port_direction:
port_direction
| CONST_ REF_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

tf_port_item:
tf_port_item_240 tf_port_item_241 data_declaration_154 data_type_or_implicit tf_port_item_242 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); }
;

tf_port_item_240:
%empty { C($$); }
| tf_port_item_240 attribute_instance { $$ = $1; P($$, $2); }
;

tf_port_item_241:
%empty { C($$); }
| tf_port_direction
;

tf_port_item_242:
%empty { C($$); }
| port_identifier tf_port_item_242_242 list_of_tf_variable_identifiers_203 { $$ = $1; P($$, $2); P($$, $3); }
;

tf_port_item_242_242:
%empty { C($$); }
| tf_port_item_242_242 variable_dimension { $$ = $1; P($$, $2); }
;

tf_port_list:
tf_port_item tf_port_list_239 { $$ = $1; P($$, $2); }
;

tf_port_list_239:
%empty { C($$); }
| tf_port_list_239 ',' tf_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

tfall_path_delay_expression:
path_delay_expression
;

threshold:
constant_expression
;

time_literal:
unsigned_number time_unit { $$ = $1; P($$, $2); }
| fixed_point_number time_unit { $$ = $1; P($$, $2); }
;

time_unit:
's' { C($$); T($$, @1, zero, zero); }
| MS_ { C($$); T($$, @1, zero, zero); }
| US_ { C($$); T($$, @1, zero, zero); }
| NS_ { C($$); T($$, @1, zero, zero); }
| PS_ { C($$); T($$, @1, zero, zero); }
| FS_ { C($$); T($$, @1, zero, zero); }
;

timecheck_condition:
mintypmax_expression
;

timeskew_timing_check:
Dtimeskew '(' reference_event ',' data_event ',' timing_check_limit timeskew_timing_check_501 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

timeskew_timing_check_501:
%empty { C($$); }
| ',' setup_timing_check_490_490 timeskew_timing_check_501_501 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

timeskew_timing_check_501_501:
%empty { C($$); }
| ',' timeskew_timing_check_501_501_501 timeskew_timing_check_501_501_502 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

timeskew_timing_check_501_501_501:
%empty { C($$); }
| event_based_flag
;

timeskew_timing_check_501_501_502:
%empty { C($$); }
| ',' timeskew_timing_check_501_501_502_502 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

timeskew_timing_check_501_501_502_502:
%empty { C($$); }
| remain_active_flag
;

timestamp_condition:
mintypmax_expression
;

timeunits_declaration:
TIMEUNIT_ time_literal ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| TIMEPRECISION_ time_literal ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| TIMEUNIT_ time_literal ';' TIMEPRECISION_ time_literal ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
| TIMEPRECISION_ time_literal ';' TIMEUNIT_ time_literal ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
| TIMEUNIT_ time_literal '/' time_literal ':' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

timeunits_declaration_59:
%empty /* { C($$); } -- ignore */
| '/' time_literal /* { C($$); T($$, @1, zero, zero); P($$, $2); } -- ignore */
;

timing_check_condition:
scalar_timing_check_condition
| '(' scalar_timing_check_condition ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

timing_check_event:
timing_check_event_506 specify_terminal_descriptor timing_check_event_507 { $$ = $1; P($$, $2); P($$, $3); }
;

timing_check_event_506:
%empty { C($$); }
| timing_check_event_control
;

timing_check_event_507:
%empty { C($$); }
| AMPAMPAMP timing_check_condition { C($$); T($$, @1, zero, zero); P($$, $2); }
;

timing_check_event_control:
POSEDGE_ { C($$); T($$, @1, zero, zero); }
| NEGEDGE_ { C($$); T($$, @1, zero, zero); }
| EDGE_ { C($$); T($$, @1, zero, zero); }
| edge_control_specifier
;

timing_check_limit:
expression
;

topmodule_identifier:
identifier
;

trans_item:
covergroup_range_list
;

trans_list:
'(' trans_set ')' trans_list_340 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); }
;

trans_list_340:
%empty { C($$); }
| trans_list_340 ',' '(' trans_set ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

trans_range_list:
trans_item
| trans_item OSBS repeat_range ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| trans_item OSBMG repeat_range ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| trans_item OSBE repeat_range ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

trans_set:
trans_range_list trans_set_341 { $$ = $1; P($$, $2); }
;

trans_set_341:
%empty { C($$); }
| trans_set_341 EG trans_range_list { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

trise_path_delay_expression:
path_delay_expression /* ignore */
;

tx0_path_delay_expression:
path_delay_expression
;

tx1_path_delay_expression:
path_delay_expression
;

txz_path_delay_expression:
path_delay_expression
;

type_assignment:
type_identifier type_assignment_217 { $$ = $1; P($$, $2); }
;

type_assignment_217:
%empty { C($$); }
| '=' data_type { C($$); T($$, @1, zero, zero); P($$, $2); }
;

type_declaration:
TYPEDEF_ data_type type_identifier type_declaration_165 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| TYPEDEF_ interface_instance_identifier constant_bit_select '.' type_identifier type_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
| TYPEDEF_ type_declaration_166 type_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

type_declaration_165:
%empty { C($$); }
| type_declaration_165 variable_dimension { $$ = $1; P($$, $2); }
;

type_declaration_166:
%empty /* { C($$); } -- ignore */
| ENUM_ /* { C($$); T($$, @1, zero, zero); } -- ignore */
| STRUCT_ { C($$); T($$, @1, zero, zero); }
| UNION_ { C($$); T($$, @1, zero, zero); }
| CLASS_ { C($$); T($$, @1, zero, zero); }
| INTERFACE_ CLASS_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

type_identifier:
identifier
;

type_reference:
TYPE_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| TYPE_ '(' data_type ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

tz_path_delay_expression:
path_delay_expression
;

tz0_path_delay_expression:
path_delay_expression
;

tz1_path_delay_expression:
path_delay_expression
;

tzx_path_delay_expression:
path_delay_expression
;

udp_ansi_declaration:
udp_ansi_declaration_398 PRIMITIVE_ udp_identifier '(' udp_declaration_port_list ')' ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); }
;

udp_ansi_declaration_398:
%empty { C($$); }
| udp_ansi_declaration_398 attribute_instance { $$ = $1; P($$, $2); }
;

udp_body:
sequential_body
;

udp_declaration:
udp_nonansi_declaration udp_declaration_399 udp_body ENDPRIMITIVE_ udp_declaration_400 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| udp_ansi_declaration udp_body ENDPRIMITIVE_ udp_declaration_400 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| EXTERN_ udp_nonansi_declaration { C($$); T($$, @1, zero, zero); P($$, $2); }
| EXTERN_ udp_ansi_declaration { C($$); T($$, @1, zero, zero); P($$, $2); }
| udp_declaration_401 PRIMITIVE_ udp_identifier '(' DOTS ')' ';' udp_declaration_402 udp_body ENDPRIMITIVE_ udp_declaration_400 { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); T($$, @5, zero, zero); T($$, @6, zero, zero); T($$, @7, zero, zero); P($$, $8); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
;

udp_declaration_399:
udp_port_declaration
| udp_declaration_399 udp_port_declaration { $$ = $1; P($$, $2); }
;

udp_declaration_400:
%empty { C($$); }
| ':' udp_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

udp_declaration_401:
%empty /* { C($$); } -- ignore */
| udp_declaration_401 attribute_instance { $$ = $1; P($$, $2); }
;

udp_declaration_402:
%empty { C($$); }
| udp_declaration_402 udp_port_declaration { $$ = $1; P($$, $2); }
;

udp_declaration_port_list:
udp_output_declaration ',' udp_input_declaration udp_declaration_port_list_404 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

udp_declaration_port_list_404:
%empty { C($$); }
| udp_declaration_port_list_404 ',' udp_input_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_identifier:
identifier
;

udp_initial_statement:
INITIAL_ output_port_identifier '=' init_val ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

udp_input_declaration:
udp_input_declaration_407 INPUT_ list_of_udp_port_identifiers { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_input_declaration_407:
%empty { C($$); }
| udp_input_declaration_407 attribute_instance { $$ = $1; P($$, $2); }
;

udp_instance:
cmos_switch_instance_364 '(' output_terminal ',' input_terminal udp_instance_416 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

udp_instance_416:
%empty { C($$); }
| udp_instance_416 ',' input_terminal { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_instantiation:
udp_identifier gate_instantiation_352 gate_instantiation_355 udp_instance udp_instantiation_415 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

udp_instantiation_415:
%empty { C($$); }
| udp_instantiation_415 ',' udp_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_nonansi_declaration:
udp_nonansi_declaration_397 PRIMITIVE_ udp_identifier '(' udp_port_list ')' ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); }
;

udp_nonansi_declaration_397:
%empty /* { C($$); } -- ignore */
| udp_nonansi_declaration_397 attribute_instance { $$ = $1; P($$, $2); }
;

udp_output_declaration:
udp_output_declaration_405 OUTPUT_ port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| udp_output_declaration_406 OUTPUT_ REG_ port_identifier ansi_port_declaration_78 { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); P($$, $5); }
;

udp_output_declaration_405:
%empty { C($$); }
| udp_output_declaration_405 attribute_instance { $$ = $1; P($$, $2); }
;

udp_output_declaration_406:
%empty /* { C($$); } -- ignore */
| udp_output_declaration_406 attribute_instance { $$ = $1; P($$, $2); }
;

udp_port_declaration:
udp_output_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| udp_input_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| udp_reg_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
;

udp_port_list:
output_port_identifier ',' input_port_identifier udp_port_list_403 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

udp_port_list_403:
%empty { C($$); }
| udp_port_list_403 ',' input_port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_reg_declaration:
udp_reg_declaration_408 REG_ variable_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_reg_declaration_408:
%empty { C($$); }
| udp_reg_declaration_408 attribute_instance { $$ = $1; P($$, $2); }
;

unary_module_path_operator:
'!' { C($$); T($$, @1, zero, zero); }
| '~' { C($$); T($$, @1, zero, zero); }
| '&' { C($$); T($$, @1, zero, zero); }
| TAMP { C($$); T($$, @1, zero, zero); }
| '|' { C($$); T($$, @1, zero, zero); }
| TPIPE { C($$); T($$, @1, zero, zero); }
| '^' { C($$); T($$, @1, zero, zero); }
| TH { C($$); T($$, @1, zero, zero); }
| HT { C($$); T($$, @1, zero, zero); }
;

unary_operator:
'+' { C($$); T($$, @1, zero, zero); }
| '-' { C($$); T($$, @1, zero, zero); }
| '!' { C($$); T($$, @1, zero, zero); }
| '~' { C($$); T($$, @1, zero, zero); }
| '&' { C($$); T($$, @1, zero, zero); }
| TAMP { C($$); T($$, @1, zero, zero); }
| '|' { C($$); T($$, @1, zero, zero); }
| TPIPE { C($$); T($$, @1, zero, zero); }
| '^' { C($$); T($$, @1, zero, zero); }
| TH { C($$); T($$, @1, zero, zero); }
| HT { C($$); T($$, @1, zero, zero); }
;

unbased_unsized_literal:
UNBASED_UNSIZED_LITERAL_ { C($$); T($$, @1, zero, zero); }
;

unique_priority:
UNIQUE_ { C($$); T($$, @1, zero, zero); }
| UNIQUE0_ { C($$); T($$, @1, zero, zero); }
| PRIORITY_ { C($$); T($$, @1, zero, zero); }
;

uniqueness_constraint:
UNIQUE_ '{' open_range_list '}' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

unpacked_dimension:
'[' constant_range ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| '[' constant_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

unsigned_number:
INTEGRAL_NUMBER_ { C($$); T($$, @1, zero, zero); }
;

unsized_dimension:
'[' ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

use_clause:
USE_ dotted_identifier use_clause_101 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| USE_ named_parameter_assignment use_clause_102 use_clause_101 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); }
| USE_ dotted_identifier named_parameter_assignment use_clause_103 use_clause_101 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); }
;

use_clause_101:
%empty { C($$); }
| ':' CONFIG_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

use_clause_102:
%empty { C($$); }
| use_clause_102 ',' named_parameter_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

use_clause_103:
%empty { C($$); }
| use_clause_103 ',' named_parameter_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

value_range:
expression
| '[' expression ':' expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

var_data_type:
data_type
| VAR_ data_type_or_implicit { C($$); T($$, @1, zero, zero); P($$, $2); }
;

variable_assignment:
variable_lvalue '=' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

variable_decl_assignment:
variable_identifier variable_decl_assignment_219 list_of_tf_variable_identifiers_203 { $$ = $1; P($$, $2); P($$, $3); }
| dynamic_array_variable_identifier unsized_dimension variable_decl_assignment_220 variable_decl_assignment_221 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| class_variable_identifier variable_decl_assignment_222 { $$ = $1; P($$, $2); }
;

variable_decl_assignment_219:
%empty /* { C($$); } -- ignore */
| variable_decl_assignment_219 variable_dimension { $$ = $1; P($$, $2); }
;

variable_decl_assignment_220:
%empty { C($$); }
| variable_decl_assignment_220 variable_dimension { $$ = $1; P($$, $2); }
;

variable_decl_assignment_221:
%empty { C($$); }
| '=' dynamic_array_new { C($$); T($$, @1, zero, zero); P($$, $2); }
;

variable_decl_assignment_222:
%empty { C($$); }
| '=' class_new { C($$); T($$, @1, zero, zero); P($$, $2); }
;

variable_dimension:
unsized_dimension
| unpacked_dimension
| associative_dimension
| queue_dimension
;

variable_identifier:
identifier
;

variable_identifier_list:
variable_identifier variable_identifier_list_431 { $$ = $1; P($$, $2); }
;

variable_identifier_list_431:
%empty { C($$); }
| variable_identifier_list_431 ',' variable_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

variable_lvalue:
variable_lvalue_555 hierarchical_variable_identifier select { $$ = $1; P($$, $2); P($$, $3); }
| '{' variable_lvalue variable_lvalue_556 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| assignment_pattern_expression_453 assignment_pattern_variable_lvalue { $$ = $1; P($$, $2); }
| streaming_concatenation
;

variable_lvalue_555:
%empty { C($$); }
| implicit_class_handle '.' { $$ = $1; T($$, @2, zero, zero); }
| package_scope
;

variable_lvalue_556:
%empty { C($$); }
| variable_lvalue_556 ',' variable_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

variable_port_header:
net_port_header_74 variable_port_type { $$ = $1; P($$, $2); }
;

variable_port_type:
var_data_type
;

wait_statement:
WAIT_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| WAIT_ FORK_ ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
| WAIT_ORDER_ '(' hierarchical_identifier wait_statement_434 ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

wait_statement_434:
%empty { C($$); }
| wait_statement_434 ',' hierarchical_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

weight_specification:
integral_number
| ps_identifier '(' expression ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

width_timing_check:
Dwidth '(' controlled_reference_event ',' timing_check_limit ',' threshold setup_timing_check_490 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

with_covergroup_expression:
covergroup_expression
;

z_or_x:
'x' { C($$); T($$, @1, zero, zero); }
| 'X' { C($$); T($$, @1, zero, zero); }
| 'z' { C($$); T($$, @1, zero, zero); }
| 'Z' { C($$); T($$, @1, zero, zero); }
;

zero_or_one:
'0' { C($$); T($$, @1, zero, zero); }
| '1' { C($$); T($$, @1, zero, zero); }
;

%%

#include "parser_e.inl"
