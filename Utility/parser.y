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
%token TAGGED_
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
%left LL GG LLL GGG
%left '+' '-'
%left '*' '/' '%'
%left SS
%token '!' '~' TAMP TPIPE PLUSPLUS MM
%left OPCP OSBCSB CC '.'

%type<results> library_text
%type<results> library_description
%type<results> library_declaration
%type<results> include_statement
%type<results> source_text
%type<results> description
%type<results> module_nonansi_header
%type<results> module_ansi_header
%type<results> module_declaration
%type<results> module_keyword
%type<results> interface_declaration
%type<results> interface_nonansi_header
%type<results> interface_ansi_header
%type<results> program_declaration
%type<results> program_nonansi_header
%type<results> program_ansi_header
%type<results> checker_declaration
%type<results> class_declaration
%type<results> interface_class_type
%type<results> interface_class_declaration
%type<results> interface_class_item
%type<results> interface_class_method
%type<results> package_declaration
%type<results> timeunits_declaration
%type<results> parameter_port_list
%type<results> parameter_port_declaration
%type<results> list_of_ports
%type<results> list_of_port_declarations
%type<results> port_declaration
%type<results> port
%type<results> port_expression
%type<results> port_reference
%type<results> port_direction
%type<results> net_port_header
%type<results> variable_port_header
%type<results> interface_port_header
%type<results> ansi_port_declaration
%type<results> elaboration_system_task
%type<results> finish_number
%type<results> module_common_item
%type<results> module_item
%type<results> module_or_generate_item
%type<results> module_or_generate_item_declaration
%type<results> non_port_module_item
%type<results> parameter_override
%type<results> bind_directive
%type<results> bind_target_scope
%type<results> bind_target_instance
%type<results> bind_target_instance_list
%type<results> bind_instantiation
%type<results> config_declaration
%type<results> design_statement
%type<results> config_rule_statement
%type<results> default_clause
%type<results> inst_clause
%type<results> inst_name
%type<results> cell_clause
%type<results> liblist_clause
%type<results> use_clause
%type<results> interface_or_generate_item
%type<results> extern_tf_declaration
%type<results> interface_item
%type<results> non_port_interface_item
%type<results> program_item
%type<results> non_port_program_item
%type<results> program_generate_item
%type<results> checker_port_list
%type<results> checker_port_item
%type<results> checker_port_direction
%type<results> checker_or_generate_item
%type<results> checker_or_generate_item_declaration
%type<results> checker_generate_item
%type<results> class_item
%type<results> class_property
%type<results> class_method
%type<results> class_constructor_prototype
%type<results> class_constraint
%type<results> class_item_qualifier
%type<results> property_qualifier
%type<results> random_qualifier
%type<results> method_qualifier
%type<results> method_prototype
%type<results> class_constructor_declaration
%type<results> constraint_declaration
%type<results> constraint_block
%type<results> constraint_block_item
%type<results> solve_before_list
%type<results> constraint_primary
%type<results> constraint_expression
%type<results> uniqueness_constraint
%type<results> constraint_set
%type<results> dist_list
%type<results> dist_item
%type<results> dist_weight
%type<results> constraint_prototype
%type<results> constraint_prototype_qualifier
%type<results> extern_constraint_declaration
%type<results> identifier_list
%type<results> package_item
%type<results> package_or_generate_item_declaration
%type<results> anonymous_program
%type<results> anonymous_program_item
%type<results> local_parameter_declaration
%type<results> parameter_declaration
%type<results> specparam_declaration
%type<results> inout_declaration
%type<results> input_declaration
%type<results> output_declaration
%type<results> interface_port_declaration
%type<results> ref_declaration
%type<results> data_declaration
%type<results> package_import_declaration
%type<results> package_import_item
%type<results> package_export_declaration
%type<results> genvar_declaration
%type<results> net_declaration
%type<results> type_declaration
%type<results> net_type_declaration
%type<results> lifetime
%type<results> casting_type
%type<results> data_type
%type<results> data_type_or_implicit
%type<results> implicit_data_type
%type<results> enum_base_type
%type<results> enum_name_declaration
%type<results> class_scope
%type<results> class_type
%type<results> integer_type
%type<results> integer_atom_type
%type<results> integer_vector_type
%type<results> non_integer_type
%type<results> net_type
%type<results> net_port_type
%type<results> variable_port_type
%type<results> var_data_type
%type<results> signing
%type<results> simple_type
%type<results> struct_union_member
%type<results> data_type_or_void
%type<results> struct_union
%type<results> type_reference
%type<results> drive_strength
%type<results> strength0
%type<results> strength1
%type<results> charge_strength
%type<results> delay3
%type<results> delay2
%type<results> delay_value
%type<results> list_of_defparam_assignments
%type<results> list_of_genvar_identifiers
%type<results> list_of_interface_identifiers
%type<results> list_of_net_decl_assignments
%type<results> list_of_param_assignments
%type<results> list_of_port_identifiers
%type<results> list_of_udp_port_identifiers
%type<results> list_of_specparam_assignments
%type<results> list_of_tf_variable_identifiers
%type<results> list_of_type_assignments
%type<results> list_of_variable_decl_assignments
%type<results> list_of_variable_identifiers
%type<results> list_of_variable_port_identifiers
%type<results> defparam_assignment
%type<results> net_decl_assignment
%type<results> param_assignment
%type<results> specparam_assignment
%type<results> type_assignment
%type<results> pulse_control_specparam
%type<results> error_limit_value
%type<results> reject_limit_value
%type<results> limit_value
%type<results> variable_decl_assignment
%type<results> class_new
%type<results> dynamic_array_new
%type<results> unpacked_dimension
%type<results> packed_dimension
%type<results> associative_dimension
%type<results> variable_dimension
%type<results> queue_dimension
%type<results> unsized_dimension
%type<results> function_data_type_or_implicit
%type<results> function_declaration
%type<results> function_body_declaration
%type<results> function_prototype
%type<results> dpi_import_export
%type<results> dpi_spec_string
%type<results> dpi_function_import_property
%type<results> dpi_task_import_property
%type<results> dpi_function_proto
%type<results> dpi_task_proto
%type<results> task_declaration
%type<results> task_body_declaration
%type<results> tf_item_declaration
%type<results> tf_port_list
%type<results> tf_port_item
%type<results> tf_port_direction
%type<results> tf_port_declaration
%type<results> task_prototype
%type<results> block_item_declaration
%type<results> overload_declaration
%type<results> overload_operator
%type<results> overload_proto_formals
%type<results> modport_declaration
%type<results> modport_item
%type<results> modport_ports_declaration
%type<results> modport_clocking_declaration
%type<results> modport_simple_ports_declaration
%type<results> modport_simple_port
%type<results> modport_tf_ports_declaration
%type<results> modport_tf_port
%type<results> import_export
%type<results> concurrent_assertion_item
%type<results> concurrent_assertion_statement
%type<results> assert_property_statement
%type<results> assume_property_statement
%type<results> cover_property_statement
%type<results> expect_property_statement
%type<results> cover_sequence_statement
%type<results> restrict_property_statement
%type<results> property_instance
%type<results> property_list_of_arguments
%type<results> property_actual_arg
%type<results> assertion_item_declaration
%type<results> property_declaration
%type<results> property_port_list
%type<results> property_port_item
%type<results> property_lvar_port_direction
%type<results> property_formal_type
%type<results> property_spec
%type<results> property_expr
%type<results> property_case_item
%type<results> sequence_declaration
%type<results> sequence_port_list
%type<results> sequence_port_item
%type<results> sequence_lvar_port_direction
%type<results> sequence_formal_type
%type<results> sequence_expr
%type<results> cycle_delay_range
%type<results> sequence_method_call
%type<results> sequence_match_item
%type<results> sequence_instance
%type<results> sequence_list_of_arguments
%type<results> sequence_actual_arg
%type<results> boolean_abbrev
%type<results> sequence_abbrev
%type<results> consecutive_repetition
%type<results> non_consecutive_repetition
%type<results> goto_repetition
%type<results> const_or_range_expression
%type<results> cycle_delay_const_range_expression
%type<results> expression_or_dist
%type<results> assertion_variable_declaration
%type<results> let_declaration
%type<results> let_identifier
%type<results> let_port_list
%type<results> let_port_item
%type<results> let_formal_type
%type<results> let_expression
%type<results> let_list_of_arguments
%type<results> let_actual_arg
%type<results> covergroup_declaration
%type<results> coverage_spec_or_option
%type<results> coverage_option
%type<results> coverage_spec
%type<results> coverage_event
%type<results> block_event_expression
%type<results> hierarchical_btf_identifier
%type<results> cover_point
%type<results> bins_or_empty
%type<results> bins_or_options
%type<results> bins_keyword
%type<results> trans_list
%type<results> trans_set
%type<results> trans_range_list
%type<results> trans_item
%type<results> repeat_range
%type<results> cover_cross
%type<results> list_of_cross_items
%type<results> cross_item
%type<results> cross_body
%type<results> cross_body_item
%type<results> bins_selection_or_option
%type<results> bins_selection
%type<results> select_expression
%type<results> select_condition
%type<results> bins_expression
%type<results> covergroup_range_list
%type<results> covergroup_value_range
%type<results> with_covergroup_expression
%type<results> set_covergroup_expression
%type<results> integer_covergroup_expression
%type<results> cross_set_expression
%type<results> covergroup_expression
%type<results> gate_instantiation
%type<results> cmos_switch_instance
%type<results> enable_gate_instance
%type<results> mos_switch_instance
%type<results> n_input_gate_instance
%type<results> n_output_gate_instance
%type<results> pass_switch_instance
%type<results> pass_enable_switch_instance
%type<results> pull_gate_instance
%type<results> pulldown_strength
%type<results> pullup_strength
%type<results> enable_terminal
%type<results> inout_terminal
%type<results> input_terminal
%type<results> ncontrol_terminal
%type<results> output_terminal
%type<results> pcontrol_terminal
%type<results> cmos_switchtype
%type<results> enable_gatetype
%type<results> mos_switchtype
%type<results> n_input_gatetype
%type<results> n_output_gatetype
%type<results> pass_en_switchtype
%type<results> pass_switchtype
%type<results> module_instantiation
%type<results> parameter_value_assignment
%type<results> list_of_parameter_assignments
%type<results> ordered_parameter_assignment
%type<results> named_parameter_assignment
%type<results> hierarchical_instance
%type<results> name_of_instance
%type<results> list_of_port_connections
%type<results> ordered_port_connection
%type<results> named_port_connection
%type<results> interface_instantiation
%type<results> program_instantiation
%type<results> checker_instantiation
%type<results> list_of_checker_port_connections
%type<results> ordered_checker_port_connection
%type<results> named_checker_port_connection
%type<results> generate_region
%type<results> loop_generate_construct
%type<results> genvar_initialization
%type<results> genvar_iteration
%type<results> conditional_generate_construct
%type<results> if_generate_construct
%type<results> case_generate_construct
%type<results> case_generate_item
%type<results> generate_block
%type<results> generate_item
%type<results> udp_nonansi_declaration
%type<results> udp_ansi_declaration
%type<results> udp_declaration
%type<results> udp_port_list
%type<results> udp_declaration_port_list
%type<results> udp_port_declaration
%type<results> udp_output_declaration
%type<results> udp_input_declaration
%type<results> udp_reg_declaration
%type<results> udp_body
%type<results> combinational_body
%type<results> combinational_entry
%type<results> sequential_body
%type<results> udp_initial_statement
%type<results> init_val
%type<results> sequential_entry
%type<results> seq_input_list
%type<results> level_input_list
%type<results> edge_input_list
%type<results> edge_indicator
%type<results> current_state
%type<results> next_state
%type<results> output_symbol
%type<results> level_symbol
%type<results> edge_symbol
%type<results> udp_instantiation
%type<results> udp_instance
%type<results> continuous_assign
%type<results> list_of_net_assignments
%type<results> list_of_variable_assignments
%type<results> net_alias
%type<results> net_assignment
%type<results> initial_construct
%type<results> always_construct
%type<results> always_keyword
%type<results> final_construct
%type<results> blocking_assignment
%type<results> operator_assignment
%type<results> assignment_operator
%type<results> nonblocking_assignment
%type<results> procedural_continuous_assignment
%type<results> variable_assignment
%type<results> action_block
%type<results> seq_block
%type<results> par_block
%type<results> join_keyword
%type<results> statement_or_null
%type<results> statement
%type<results> statement_item
%type<results> function_statement
%type<results> function_statement_or_null
%type<results> variable_identifier_list
%type<results> procedural_timing_control_statement
%type<results> delay_or_event_control
%type<results> delay_control
%type<results> event_control
%type<results> event_expression
%type<results> procedural_timing_control
%type<results> jump_statement
%type<results> wait_statement
%type<results> event_trigger
%type<results> disable_statement
%type<results> conditional_statement
%type<results> unique_priority
%type<results> cond_predicate
%type<results> expression_or_cond_pattern
%type<results> cond_pattern
%type<results> case_statement
%type<results> case_keyword
%type<results> case_expression
%type<results> case_item
%type<results> case_pattern_item
%type<results> case_inside_item
%type<results> case_item_expression
%type<results> randcase_statement
%type<results> randcase_item
%type<results> open_range_list
%type<results> open_value_range
%type<results> pattern
%type<results> assignment_pattern
%type<results> structure_pattern_key
%type<results> array_pattern_key
%type<results> assignment_pattern_key
%type<results> assignment_pattern_expression
%type<results> assignment_pattern_expression_type
%type<results> constant_assignment_pattern_expression
%type<results> assignment_pattern_net_lvalue
%type<results> assignment_pattern_variable_lvalue
%type<results> loop_statement
%type<results> for_initialization
%type<results> for_variable_declaration
%type<results> for_step
%type<results> for_step_assignment
%type<results> loop_variables
%type<results> subroutine_call_statement
%type<results> assertion_item
%type<results> deferred_immediate_assertion_item
%type<results> procedural_assertion_statement
%type<results> immediate_assertion_statement
%type<results> simple_immediate_assertion_statement
%type<results> simple_immediate_assert_statement
%type<results> simple_immediate_assume_statement
%type<results> simple_immediate_cover_statement
%type<results> deferred_immediate_assertion_statement
%type<results> deferred_immediate_assert_statement
%type<results> deferred_immediate_assume_statement
%type<results> deferred_immediate_cover_statement
%type<results> clocking_declaration
%type<results> clocking_event
%type<results> clocking_item
%type<results> default_skew
%type<results> clocking_direction
%type<results> list_of_clocking_decl_assign
%type<results> clocking_decl_assign
%type<results> clocking_skew
%type<results> clocking_drive
%type<results> cycle_delay
%type<results> clockvar
%type<results> clockvar_expression
%type<results> randsequence_statement
%type<results> production
%type<results> rs_rule
%type<results> rs_production_list
%type<results> weight_specification
%type<results> rs_code_block
%type<results> rs_prod
%type<results> production_item
%type<results> rs_if_else
%type<results> rs_repeat
%type<results> rs_case
%type<results> rs_case_item
%type<results> specify_block
%type<results> specify_item
%type<results> pulsestyle_declaration
%type<results> showcancelled_declaration
%type<results> path_declaration
%type<results> simple_path_declaration
%type<results> parallel_path_description
%type<results> full_path_description
%type<results> list_of_path_inputs
%type<results> list_of_path_outputs
%type<results> specify_input_terminal_descriptor
%type<results> specify_output_terminal_descriptor
%type<results> input_identifier
%type<results> output_identifier
%type<results> path_delay_value
%type<results> list_of_path_delay_expressions
%type<results> t_path_delay_expression
%type<results> trise_path_delay_expression
%type<results> tfall_path_delay_expression
%type<results> tz_path_delay_expression
%type<results> t01_path_delay_expression
%type<results> t10_path_delay_expression
%type<results> t0z_path_delay_expression
%type<results> tz1_path_delay_expression
%type<results> t1z_path_delay_expression
%type<results> tz0_path_delay_expression
%type<results> t0x_path_delay_expression
%type<results> tx1_path_delay_expression
%type<results> t1x_path_delay_expression
%type<results> tx0_path_delay_expression
%type<results> txz_path_delay_expression
%type<results> tzx_path_delay_expression
%type<results> path_delay_expression
%type<results> edge_sensitive_path_declaration
%type<results> parallel_edge_sensitive_path_description
%type<results> full_edge_sensitive_path_description
%type<results> data_source_expression
%type<results> edge_identifier
%type<results> state_dependent_path_declaration
%type<results> polarity_operator
%type<results> system_timing_check
%type<results> setup_timing_check
%type<results> hold_timing_check
%type<results> setuphold_timing_check
%type<results> recovery_timing_check
%type<results> removal_timing_check
%type<results> recrem_timing_check
%type<results> skew_timing_check
%type<results> timeskew_timing_check
%type<results> fullskew_timing_check
%type<results> period_timing_check
%type<results> width_timing_check
%type<results> nochange_timing_check
%type<results> timecheck_condition
%type<results> controlled_reference_event
%type<results> data_event
%type<results> delayed_data
%type<results> delayed_reference
%type<results> end_edge_offset
%type<results> event_based_flag
%type<results> notifier
%type<results> reference_event
%type<results> remain_active_flag
%type<results> timestamp_condition
%type<results> start_edge_offset
%type<results> threshold
%type<results> timing_check_limit
%type<results> timing_check_event
%type<results> controlled_timing_check_event
%type<results> timing_check_event_control
%type<results> specify_terminal_descriptor
%type<results> edge_control_specifier
%type<results> edge_descriptor
%type<results> zero_or_one
%type<results> z_or_x
%type<results> timing_check_condition
%type<results> scalar_timing_check_condition
%type<results> scalar_constant
%type<results> concatenation
%type<results> constant_concatenation
%type<results> constant_multiple_concatenation
%type<results> module_path_concatenation
%type<results> module_path_multiple_concatenation
%type<results> multiple_concatenation
%type<results> streaming_concatenation
%type<results> stream_operator
%type<results> slice_size
%type<results> stream_concatenation
%type<results> stream_expression
%type<results> array_range_expression
%type<results> empty_queue
%type<results> constant_function_call
%type<results> tf_call
%type<results> system_tf_call
%type<results> subroutine_call
%type<results> function_subroutine_call
%type<results> list_of_arguments
%type<results> method_call
%type<results> method_call_body
%type<results> built_in_method_call
%type<results> array_manipulation_call
%type<results> randomize_call
%type<results> method_call_root
%type<results> array_method_name
%type<results> inc_or_dec_expression
%type<results> conditional_expression
%type<results> constant_expression
%type<results> constant_mintypmax_expression
%type<results> constant_param_expression
%type<results> param_expression
%type<results> constant_range_expression
%type<results> constant_part_select_range
%type<results> constant_range
%type<results> constant_indexed_range
%type<results> expression
%type<results> tagged_union_expression
%type<results> inside_expression
%type<results> value_range
%type<results> mintypmax_expression
%type<results> module_path_conditional_expression
%type<results> module_path_expression
%type<results> module_path_mintypmax_expression
%type<results> part_select_range
%type<results> indexed_range
%type<results> genvar_expression
%type<results> constant_primary
%type<results> module_path_primary
%type<results> primary
%type<results> class_qualifier
%type<results> range_expression
%type<results> primary_literal
%type<results> time_literal
%type<results> time_unit
%type<results> implicit_class_handle
%type<results> bit_select
%type<results> select
%type<results> nonrange_select
%type<results> constant_bit_select
%type<results> constant_select
%type<results> constant_cast
%type<results> constant_let_expression
%type<results> cast
%type<results> net_lvalue
%type<results> variable_lvalue
%type<results> nonrange_variable_lvalue
%type<results> unary_operator
%type<results> binary_operator
%type<results> inc_or_dec_operator
%type<results> unary_module_path_operator
%type<results> binary_module_path_operator
%type<results> number
%type<results> attribute_instance
%type<results> attr_spec
%type<results> attr_name
%type<results> block_identifier
%type<results> bin_identifier
%type<results> cell_identifier
%type<results> checker_identifier
%type<results> class_identifier
%type<results> class_variable_identifier
%type<results> clocking_identifier
%type<results> config_identifier
%type<results> const_identifier
%type<results> constraint_identifier
%type<results> covergroup_identifier
%type<results> cover_point_identifier
%type<results> cross_identifier
%type<results> dynamic_array_variable_identifier
%type<results> enum_identifier
%type<results> formal_port_identifier
%type<results> function_identifier
%type<results> generate_block_identifier
%type<results> genvar_identifier
%type<results> hierarchical_array_identifier
%type<results> hierarchical_block_identifier
%type<results> hierarchical_event_identifier
%type<results> hierarchical_identifier
%type<results> hierarchical_net_identifier
%type<results> hierarchical_parameter_identifier
%type<results> hierarchical_property_identifier
%type<results> hierarchical_sequence_identifier
%type<results> hierarchical_task_identifier
%type<results> hierarchical_tf_identifier
%type<results> hierarchical_variable_identifier
%type<results> identifier
%type<results> index_variable_identifier
%type<results> interface_identifier
%type<results> interface_instance_identifier
%type<results> inout_port_identifier
%type<results> input_port_identifier
%type<results> instance_identifier
%type<results> library_identifier
%type<results> member_identifier
%type<results> method_identifier
%type<results> modport_identifier
%type<results> module_identifier
%type<results> net_identifier
%type<results> net_type_identifier
%type<results> output_port_identifier
%type<results> package_identifier
%type<results> package_scope
%type<results> parameter_identifier
%type<results> port_identifier
%type<results> production_identifier
%type<results> program_identifier
%type<results> property_identifier
%type<results> ps_class_identifier
%type<results> ps_covergroup_identifier
%type<results> ps_checker_identifier
%type<results> ps_identifier
%type<results> ps_or_hierarchical_array_identifier
%type<results> ps_or_hierarchical_net_identifier
%type<results> ps_or_hierarchical_property_identifier
%type<results> ps_or_hierarchical_sequence_identifier
%type<results> ps_or_hierarchical_tf_identifier
%type<results> ps_parameter_identifier
%type<results> ps_type_identifier
%type<results> sequence_identifier
%type<results> signal_identifier
%type<results> specparam_identifier
%type<results> task_identifier
%type<results> tf_identifier
%type<results> terminal_identifier
%type<results> topmodule_identifier
%type<results> type_identifier
%type<results> udp_identifier
%type<results> variable_identifier
%type<results> library_text_0
%type<results> library_declaration_1
%type<results> library_declaration_2_2
%type<results> library_declaration_2
%type<results> source_text_4
%type<results> source_text_5
%type<results> description_6
%type<results> description_7
%type<results> module_nonansi_header_8
%type<results> module_nonansi_header_9
%type<results> module_nonansi_header_10
%type<results> module_nonansi_header_11
%type<results> module_ansi_header_12
%type<results> module_ansi_header_13
%type<results> module_ansi_header_14
%type<results> module_ansi_header_15
%type<results> module_ansi_header_16
%type<results> module_declaration_17
%type<results> module_declaration_18
%type<results> module_declaration_19
%type<results> module_declaration_20
%type<results> module_declaration_21
%type<results> module_declaration_22
%type<results> module_declaration_23
%type<results> module_declaration_24
%type<results> module_declaration_25
%type<results> module_declaration_26
%type<results> module_declaration_27
%type<results> interface_declaration_28
%type<results> interface_declaration_29
%type<results> interface_declaration_30
%type<results> interface_declaration_31
%type<results> interface_declaration_32
%type<results> interface_declaration_33
%type<results> interface_declaration_34
%type<results> interface_declaration_35
%type<results> interface_declaration_36
%type<results> interface_declaration_37
%type<results> interface_nonansi_header_38
%type<results> interface_nonansi_header_39
%type<results> interface_nonansi_header_40
%type<results> interface_nonansi_header_41
%type<results> interface_ansi_header_42
%type<results> interface_ansi_header_43
%type<results> interface_ansi_header_44
%type<results> interface_ansi_header_45
%type<results> interface_ansi_header_46
%type<results> program_declaration_47
%type<results> program_declaration_48
%type<results> program_declaration_49
%type<results> program_declaration_50
%type<results> program_declaration_51
%type<results> program_declaration_52
%type<results> program_declaration_53
%type<results> program_declaration_54
%type<results> program_declaration_55
%type<results> program_declaration_56
%type<results> program_nonansi_header_57
%type<results> program_nonansi_header_58
%type<results> program_nonansi_header_59
%type<results> program_nonansi_header_60
%type<results> program_ansi_header_61
%type<results> program_ansi_header_62
%type<results> program_ansi_header_63
%type<results> program_ansi_header_64
%type<results> program_ansi_header_65
%type<results> checker_declaration_66_66
%type<results> checker_declaration_66
%type<results> checker_declaration_68_68
%type<results> checker_declaration_68
%type<results> checker_declaration_70
%type<results> class_declaration_71
%type<results> class_declaration_72
%type<results> class_declaration_73
%type<results> class_declaration_74_74
%type<results> class_declaration_74
%type<results> class_declaration_76_76
%type<results> class_declaration_76
%type<results> class_declaration_78
%type<results> class_declaration_79
%type<results> interface_class_type_80
%type<results> interface_class_declaration_81
%type<results> interface_class_declaration_82_82
%type<results> interface_class_declaration_82
%type<results> interface_class_declaration_84
%type<results> interface_class_declaration_85
%type<results> interface_class_item_86
%type<results> package_declaration_87
%type<results> package_declaration_88
%type<results> package_declaration_89
%type<results> package_declaration_90_90
%type<results> package_declaration_90
%type<results> package_declaration_92
%type<results> timeunits_declaration_93
%type<results> parameter_port_list_94
%type<results> parameter_port_list_95
%type<results> list_of_ports_96
%type<results> list_of_port_declarations_97_97
%type<results> list_of_port_declarations_97_98_98
%type<results> list_of_port_declarations_97_98
%type<results> list_of_port_declarations_97
%type<results> port_declaration_101
%type<results> port_declaration_102
%type<results> port_declaration_103
%type<results> port_declaration_104
%type<results> port_declaration_105
%type<results> port_106
%type<results> port_107
%type<results> port_expression_108
%type<results> net_port_header_109
%type<results> variable_port_header_110
%type<results> interface_port_header_111
%type<results> interface_port_header_112
%type<results> ansi_port_declaration_113
%type<results> ansi_port_declaration_114
%type<results> ansi_port_declaration_115
%type<results> ansi_port_declaration_116
%type<results> ansi_port_declaration_117
%type<results> ansi_port_declaration_118
%type<results> ansi_port_declaration_119
%type<results> ansi_port_declaration_120
%type<results> elaboration_system_task_121_121
%type<results> elaboration_system_task_121
%type<results> elaboration_system_task_123_123
%type<results> elaboration_system_task_123
%type<results> elaboration_system_task_125_125
%type<results> elaboration_system_task_125
%type<results> elaboration_system_task_127_127
%type<results> elaboration_system_task_127
%type<results> module_or_generate_item_129
%type<results> module_or_generate_item_130
%type<results> module_or_generate_item_131
%type<results> module_or_generate_item_132
%type<results> module_or_generate_item_133
%type<results> non_port_module_item_134
%type<results> bind_directive_135
%type<results> bind_target_instance_list_136
%type<results> config_declaration_137
%type<results> config_declaration_138
%type<results> config_declaration_139
%type<results> design_statement_140_140
%type<results> design_statement_140
%type<results> inst_name_142
%type<results> cell_clause_143
%type<results> liblist_clause_144
%type<results> use_clause_145
%type<results> use_clause_146
%type<results> use_clause_147
%type<results> use_clause_148
%type<results> use_clause_149
%type<results> use_clause_150
%type<results> use_clause_151
%type<results> interface_or_generate_item_152
%type<results> interface_or_generate_item_153
%type<results> interface_or_generate_item_154
%type<results> non_port_program_item_155
%type<results> non_port_program_item_156
%type<results> non_port_program_item_157
%type<results> non_port_program_item_158
%type<results> non_port_program_item_159
%type<results> checker_port_list_160
%type<results> checker_port_item_161
%type<results> checker_port_item_162
%type<results> checker_port_item_163
%type<results> checker_port_item_164
%type<results> checker_or_generate_item_declaration_165
%type<results> class_item_166
%type<results> class_item_167
%type<results> class_item_168
%type<results> class_item_169
%type<results> class_item_170
%type<results> class_property_171
%type<results> class_property_172
%type<results> class_property_173
%type<results> class_method_174
%type<results> class_method_175
%type<results> class_method_176
%type<results> class_method_177
%type<results> class_method_178
%type<results> class_method_179
%type<results> class_constructor_prototype_180_180
%type<results> class_constructor_prototype_180
%type<results> method_qualifier_182
%type<results> class_constructor_declaration_183
%type<results> class_constructor_declaration_184_184
%type<results> class_constructor_declaration_184
%type<results> class_constructor_declaration_186
%type<results> class_constructor_declaration_187_187
%type<results> class_constructor_declaration_187
%type<results> class_constructor_declaration_189
%type<results> class_constructor_declaration_190
%type<results> constraint_declaration_191
%type<results> constraint_block_192
%type<results> solve_before_list_193
%type<results> constraint_primary_194
%type<results> constraint_expression_195
%type<results> constraint_expression_196
%type<results> constraint_expression_197
%type<results> constraint_set_198
%type<results> dist_list_199
%type<results> dist_item_200
%type<results> constraint_prototype_201
%type<results> constraint_prototype_202
%type<results> extern_constraint_declaration_203
%type<results> identifier_list_204
%type<results> anonymous_program_205
%type<results> specparam_declaration_206
%type<results> data_declaration_207
%type<results> data_declaration_208
%type<results> data_declaration_209
%type<results> package_import_declaration_210
%type<results> package_export_declaration_211
%type<results> net_declaration_212
%type<results> net_declaration_213
%type<results> net_declaration_214
%type<results> net_declaration_215
%type<results> net_declaration_216
%type<results> net_declaration_217
%type<results> net_declaration_218_218
%type<results> net_declaration_218
%type<results> type_declaration_220
%type<results> type_declaration_221
%type<results> net_type_declaration_222_222
%type<results> net_type_declaration_222
%type<results> net_type_declaration_224
%type<results> data_type_225
%type<results> data_type_226
%type<results> data_type_227
%type<results> data_type_228_228
%type<results> data_type_228
%type<results> data_type_230
%type<results> data_type_231
%type<results> data_type_232
%type<results> data_type_233
%type<results> data_type_234
%type<results> data_type_235
%type<results> data_type_236
%type<results> data_type_237
%type<results> data_type_238
%type<results> data_type_239
%type<results> implicit_data_type_240
%type<results> implicit_data_type_241
%type<results> enum_base_type_242
%type<results> enum_base_type_243
%type<results> enum_base_type_244
%type<results> enum_base_type_245
%type<results> enum_name_declaration_246_246
%type<results> enum_name_declaration_246
%type<results> enum_name_declaration_248
%type<results> class_type_249
%type<results> class_type_250_250
%type<results> class_type_250
%type<results> net_port_type_252
%type<results> struct_union_member_253
%type<results> struct_union_member_254
%type<results> struct_union_255
%type<results> delay3_256_256
%type<results> delay3_256
%type<results> delay2_258
%type<results> list_of_defparam_assignments_259
%type<results> list_of_genvar_identifiers_260
%type<results> list_of_interface_identifiers_261
%type<results> list_of_interface_identifiers_262_262
%type<results> list_of_interface_identifiers_262
%type<results> list_of_net_decl_assignments_264
%type<results> list_of_param_assignments_265
%type<results> list_of_port_identifiers_266
%type<results> list_of_port_identifiers_267_267
%type<results> list_of_port_identifiers_267
%type<results> list_of_udp_port_identifiers_269
%type<results> list_of_specparam_assignments_270
%type<results> list_of_tf_variable_identifiers_271
%type<results> list_of_tf_variable_identifiers_272
%type<results> list_of_tf_variable_identifiers_273_273
%type<results> list_of_tf_variable_identifiers_273_274
%type<results> list_of_tf_variable_identifiers_273
%type<results> list_of_type_assignments_276
%type<results> list_of_variable_decl_assignments_277
%type<results> list_of_variable_identifiers_278
%type<results> list_of_variable_identifiers_279_279
%type<results> list_of_variable_identifiers_279
%type<results> list_of_variable_port_identifiers_281
%type<results> list_of_variable_port_identifiers_282
%type<results> list_of_variable_port_identifiers_283_283
%type<results> list_of_variable_port_identifiers_283_284
%type<results> list_of_variable_port_identifiers_283
%type<results> net_decl_assignment_286
%type<results> net_decl_assignment_287
%type<results> param_assignment_288
%type<results> param_assignment_289
%type<results> type_assignment_290
%type<results> pulse_control_specparam_291
%type<results> pulse_control_specparam_292
%type<results> variable_decl_assignment_293
%type<results> variable_decl_assignment_294
%type<results> variable_decl_assignment_295
%type<results> variable_decl_assignment_296
%type<results> variable_decl_assignment_297
%type<results> class_new_298
%type<results> class_new_299
%type<results> dynamic_array_new_300
%type<results> queue_dimension_301
%type<results> function_declaration_302
%type<results> function_body_declaration_303
%type<results> function_body_declaration_304
%type<results> function_body_declaration_305
%type<results> function_body_declaration_306
%type<results> function_body_declaration_307
%type<results> function_body_declaration_308
%type<results> function_body_declaration_309
%type<results> function_body_declaration_310
%type<results> function_body_declaration_311
%type<results> function_prototype_312_312
%type<results> function_prototype_312
%type<results> dpi_import_export_314
%type<results> dpi_import_export_315
%type<results> dpi_import_export_316
%type<results> dpi_import_export_317
%type<results> dpi_import_export_318
%type<results> dpi_import_export_319
%type<results> task_declaration_320
%type<results> task_body_declaration_321
%type<results> task_body_declaration_322
%type<results> task_body_declaration_323
%type<results> task_body_declaration_324
%type<results> task_body_declaration_325
%type<results> task_body_declaration_326
%type<results> task_body_declaration_327
%type<results> task_body_declaration_328
%type<results> task_body_declaration_329
%type<results> tf_port_list_330
%type<results> tf_port_item_331
%type<results> tf_port_item_332
%type<results> tf_port_item_333
%type<results> tf_port_item_334_334
%type<results> tf_port_item_334_335
%type<results> tf_port_item_334
%type<results> tf_port_declaration_337
%type<results> tf_port_declaration_338
%type<results> task_prototype_339_339
%type<results> task_prototype_339
%type<results> block_item_declaration_341
%type<results> block_item_declaration_342
%type<results> block_item_declaration_343
%type<results> block_item_declaration_344
%type<results> block_item_declaration_345
%type<results> overload_proto_formals_346
%type<results> modport_declaration_347
%type<results> modport_item_348
%type<results> modport_ports_declaration_349
%type<results> modport_ports_declaration_350
%type<results> modport_ports_declaration_351
%type<results> modport_simple_ports_declaration_352
%type<results> modport_simple_port_353
%type<results> modport_tf_ports_declaration_354
%type<results> concurrent_assertion_item_355
%type<results> cover_sequence_statement_356
%type<results> cover_sequence_statement_357
%type<results> property_instance_358_358
%type<results> property_instance_358
%type<results> property_list_of_arguments_360
%type<results> property_list_of_arguments_361_361
%type<results> property_list_of_arguments_361
%type<results> property_list_of_arguments_363_363
%type<results> property_list_of_arguments_363
%type<results> property_list_of_arguments_365
%type<results> property_list_of_arguments_366_366
%type<results> property_list_of_arguments_366
%type<results> property_declaration_368_368
%type<results> property_declaration_368
%type<results> property_declaration_370
%type<results> property_declaration_371
%type<results> property_declaration_372
%type<results> property_port_list_373
%type<results> property_port_item_374
%type<results> property_port_item_375_375
%type<results> property_port_item_375
%type<results> property_port_item_377
%type<results> property_port_item_378
%type<results> property_spec_379
%type<results> property_spec_380
%type<results> property_expr_381
%type<results> property_expr_382
%type<results> property_expr_383
%type<results> property_expr_384
%type<results> property_expr_385
%type<results> property_expr_386
%type<results> property_expr_387
%type<results> property_expr_388
%type<results> property_case_item_389
%type<results> property_case_item_390
%type<results> property_case_item_391
%type<results> property_case_item_392
%type<results> sequence_declaration_393_393
%type<results> sequence_declaration_393
%type<results> sequence_declaration_395
%type<results> sequence_declaration_396
%type<results> sequence_declaration_397
%type<results> sequence_port_list_398
%type<results> sequence_port_item_399
%type<results> sequence_port_item_400_400
%type<results> sequence_port_item_400
%type<results> sequence_port_item_402
%type<results> sequence_port_item_403
%type<results> sequence_expr_404
%type<results> sequence_expr_405
%type<results> sequence_expr_406
%type<results> sequence_expr_407
%type<results> sequence_expr_408
%type<results> sequence_expr_409
%type<results> sequence_expr_410
%type<results> sequence_instance_411_411
%type<results> sequence_instance_411
%type<results> sequence_list_of_arguments_413
%type<results> sequence_list_of_arguments_414_414
%type<results> sequence_list_of_arguments_414
%type<results> sequence_list_of_arguments_416_416
%type<results> sequence_list_of_arguments_416
%type<results> sequence_list_of_arguments_418
%type<results> sequence_list_of_arguments_419_419
%type<results> sequence_list_of_arguments_419
%type<results> expression_or_dist_421_421
%type<results> expression_or_dist_421
%type<results> let_declaration_423_423
%type<results> let_declaration_423
%type<results> let_port_list_425
%type<results> let_port_item_426
%type<results> let_port_item_427
%type<results> let_port_item_428
%type<results> let_expression_429
%type<results> let_expression_430_430
%type<results> let_expression_430
%type<results> let_list_of_arguments_432
%type<results> let_list_of_arguments_433_433
%type<results> let_list_of_arguments_433
%type<results> let_list_of_arguments_435_435
%type<results> let_list_of_arguments_435
%type<results> let_list_of_arguments_437
%type<results> let_list_of_arguments_438_438
%type<results> let_list_of_arguments_438
%type<results> covergroup_declaration_440_440
%type<results> covergroup_declaration_440
%type<results> covergroup_declaration_442
%type<results> covergroup_declaration_443
%type<results> covergroup_declaration_444
%type<results> coverage_spec_or_option_445
%type<results> coverage_spec_or_option_446
%type<results> coverage_event_447
%type<results> hierarchical_btf_identifier_448
%type<results> cover_point_449_449
%type<results> cover_point_449
%type<results> cover_point_451
%type<results> bins_or_empty_452_452
%type<results> bins_or_empty_452_453
%type<results> bins_or_empty_452
%type<results> bins_or_options_455
%type<results> bins_or_options_456_456
%type<results> bins_or_options_456
%type<results> bins_or_options_458
%type<results> bins_or_options_459
%type<results> bins_or_options_460
%type<results> bins_or_options_461_461
%type<results> bins_or_options_461
%type<results> bins_or_options_463
%type<results> bins_or_options_464
%type<results> bins_or_options_465
%type<results> bins_or_options_466_466
%type<results> bins_or_options_466
%type<results> bins_or_options_468
%type<results> bins_or_options_469
%type<results> bins_or_options_470
%type<results> bins_or_options_471
%type<results> bins_or_options_472_472_472
%type<results> bins_or_options_472_472
%type<results> bins_or_options_472
%type<results> bins_or_options_475
%type<results> bins_or_options_476
%type<results> trans_list_477
%type<results> trans_set_478
%type<results> cover_cross_479
%type<results> cover_cross_480
%type<results> list_of_cross_items_481
%type<results> cross_body_482
%type<results> bins_selection_or_option_483
%type<results> bins_selection_or_option_484
%type<results> bins_selection_485
%type<results> select_expression_486
%type<results> select_expression_487
%type<results> select_condition_488
%type<results> bins_expression_489
%type<results> covergroup_range_list_490
%type<results> gate_instantiation_491
%type<results> gate_instantiation_492
%type<results> gate_instantiation_493
%type<results> gate_instantiation_494
%type<results> gate_instantiation_495
%type<results> gate_instantiation_496
%type<results> gate_instantiation_497
%type<results> gate_instantiation_498
%type<results> gate_instantiation_499
%type<results> gate_instantiation_500
%type<results> gate_instantiation_501
%type<results> gate_instantiation_502
%type<results> gate_instantiation_503
%type<results> gate_instantiation_504
%type<results> gate_instantiation_505
%type<results> gate_instantiation_506
%type<results> gate_instantiation_507
%type<results> gate_instantiation_508
%type<results> gate_instantiation_509
%type<results> gate_instantiation_510
%type<results> cmos_switch_instance_511
%type<results> enable_gate_instance_512
%type<results> mos_switch_instance_513
%type<results> n_input_gate_instance_514
%type<results> n_input_gate_instance_515
%type<results> n_output_gate_instance_516
%type<results> n_output_gate_instance_517
%type<results> pass_switch_instance_518
%type<results> pass_enable_switch_instance_519
%type<results> pull_gate_instance_520
%type<results> module_instantiation_521
%type<results> module_instantiation_522
%type<results> parameter_value_assignment_523
%type<results> list_of_parameter_assignments_524
%type<results> list_of_parameter_assignments_525
%type<results> named_parameter_assignment_526
%type<results> hierarchical_instance_527
%type<results> name_of_instance_528
%type<results> list_of_port_connections_529
%type<results> list_of_port_connections_530
%type<results> ordered_port_connection_531
%type<results> ordered_port_connection_532
%type<results> named_port_connection_533
%type<results> named_port_connection_534_534
%type<results> named_port_connection_534
%type<results> named_port_connection_536
%type<results> interface_instantiation_537
%type<results> interface_instantiation_538
%type<results> program_instantiation_539
%type<results> program_instantiation_540
%type<results> checker_instantiation_541
%type<results> list_of_checker_port_connections_542
%type<results> list_of_checker_port_connections_543
%type<results> ordered_checker_port_connection_544
%type<results> ordered_checker_port_connection_545
%type<results> named_checker_port_connection_546
%type<results> named_checker_port_connection_547_547
%type<results> named_checker_port_connection_547
%type<results> named_checker_port_connection_549
%type<results> generate_region_550
%type<results> genvar_initialization_551
%type<results> if_generate_construct_552
%type<results> case_generate_construct_553
%type<results> case_generate_item_554
%type<results> case_generate_item_555
%type<results> generate_block_556
%type<results> generate_block_557
%type<results> generate_block_558
%type<results> generate_block_559
%type<results> udp_nonansi_declaration_560
%type<results> udp_ansi_declaration_561
%type<results> udp_declaration_562
%type<results> udp_declaration_563
%type<results> udp_declaration_564
%type<results> udp_declaration_565
%type<results> udp_declaration_566
%type<results> udp_declaration_567
%type<results> udp_port_list_568
%type<results> udp_declaration_port_list_569
%type<results> udp_output_declaration_570
%type<results> udp_output_declaration_571
%type<results> udp_output_declaration_572
%type<results> udp_input_declaration_573
%type<results> udp_reg_declaration_574
%type<results> combinational_body_575
%type<results> sequential_body_576
%type<results> sequential_body_577
%type<results> level_input_list_578
%type<results> edge_input_list_579
%type<results> edge_input_list_580
%type<results> udp_instantiation_581
%type<results> udp_instantiation_582
%type<results> udp_instantiation_583
%type<results> udp_instance_584
%type<results> udp_instance_585
%type<results> continuous_assign_586
%type<results> continuous_assign_587
%type<results> continuous_assign_588
%type<results> list_of_net_assignments_589
%type<results> list_of_variable_assignments_590
%type<results> net_alias_591
%type<results> blocking_assignment_592
%type<results> nonblocking_assignment_593
%type<results> action_block_594
%type<results> seq_block_595
%type<results> seq_block_596
%type<results> seq_block_597
%type<results> seq_block_598
%type<results> par_block_599
%type<results> par_block_600
%type<results> par_block_601
%type<results> par_block_602
%type<results> statement_or_null_603
%type<results> statement_604
%type<results> statement_605
%type<results> function_statement_or_null_606
%type<results> variable_identifier_list_607
%type<results> event_expression_608
%type<results> event_expression_609
%type<results> event_expression_610
%type<results> jump_statement_611
%type<results> wait_statement_612
%type<results> event_trigger_613
%type<results> conditional_statement_614
%type<results> conditional_statement_615
%type<results> conditional_statement_616
%type<results> cond_predicate_617
%type<results> case_statement_618
%type<results> case_statement_619
%type<results> case_statement_620
%type<results> case_statement_621
%type<results> case_statement_622
%type<results> case_statement_623
%type<results> case_item_624
%type<results> case_item_625
%type<results> case_pattern_item_626
%type<results> case_pattern_item_627
%type<results> case_inside_item_628
%type<results> randcase_statement_629
%type<results> open_range_list_630
%type<results> pattern_631
%type<results> pattern_632
%type<results> pattern_633
%type<results> assignment_pattern_634
%type<results> assignment_pattern_635
%type<results> assignment_pattern_636
%type<results> assignment_pattern_637
%type<results> assignment_pattern_expression_638
%type<results> assignment_pattern_net_lvalue_639
%type<results> assignment_pattern_variable_lvalue_640
%type<results> loop_statement_641
%type<results> loop_statement_642
%type<results> loop_statement_643
%type<results> loop_statement_644
%type<results> for_initialization_645
%type<results> for_variable_declaration_646
%type<results> for_variable_declaration_647
%type<results> for_step_648
%type<results> loop_variables_649
%type<results> loop_variables_650_650
%type<results> loop_variables_650
%type<results> deferred_immediate_assertion_item_652
%type<results> clocking_declaration_653
%type<results> clocking_declaration_654
%type<results> clocking_declaration_655
%type<results> clocking_declaration_656
%type<results> clocking_declaration_657
%type<results> clocking_declaration_658
%type<results> clocking_item_659
%type<results> clocking_direction_660
%type<results> clocking_direction_661
%type<results> clocking_direction_662
%type<results> clocking_direction_663
%type<results> list_of_clocking_decl_assign_664
%type<results> clocking_decl_assign_665
%type<results> clocking_skew_666
%type<results> clocking_drive_667
%type<results> randsequence_statement_668
%type<results> randsequence_statement_669
%type<results> production_670
%type<results> production_671
%type<results> production_672
%type<results> rs_rule_673_673
%type<results> rs_rule_673
%type<results> rs_production_list_675
%type<results> rs_production_list_676
%type<results> rs_production_list_677
%type<results> rs_code_block_678
%type<results> rs_code_block_679
%type<results> production_item_680
%type<results> rs_if_else_681
%type<results> rs_case_682
%type<results> rs_case_item_683
%type<results> rs_case_item_684
%type<results> specify_block_685
%type<results> parallel_path_description_686
%type<results> full_path_description_687
%type<results> list_of_path_inputs_688
%type<results> list_of_path_outputs_689
%type<results> specify_input_terminal_descriptor_690
%type<results> specify_output_terminal_descriptor_691
%type<results> parallel_edge_sensitive_path_description_692
%type<results> parallel_edge_sensitive_path_description_693
%type<results> parallel_edge_sensitive_path_description_694
%type<results> full_edge_sensitive_path_description_695
%type<results> full_edge_sensitive_path_description_696
%type<results> full_edge_sensitive_path_description_697
%type<results> setup_timing_check_698_698
%type<results> setup_timing_check_698
%type<results> hold_timing_check_700_700
%type<results> hold_timing_check_700
%type<results> setuphold_timing_check_702_702
%type<results> setuphold_timing_check_702_703_703
%type<results> setuphold_timing_check_702_703_704_704
%type<results> setuphold_timing_check_702_703_704_705_705
%type<results> setuphold_timing_check_702_703_704_705_706_706
%type<results> setuphold_timing_check_702_703_704_705_706
%type<results> setuphold_timing_check_702_703_704_705
%type<results> setuphold_timing_check_702_703_704
%type<results> setuphold_timing_check_702_703
%type<results> setuphold_timing_check_702
%type<results> recovery_timing_check_712_712
%type<results> recovery_timing_check_712
%type<results> removal_timing_check_714_714
%type<results> removal_timing_check_714
%type<results> recrem_timing_check_716_716
%type<results> recrem_timing_check_716_717_717
%type<results> recrem_timing_check_716_717_718_718
%type<results> recrem_timing_check_716_717_718_719_719
%type<results> recrem_timing_check_716_717_718_719_720_720
%type<results> recrem_timing_check_716_717_718_719_720
%type<results> recrem_timing_check_716_717_718_719
%type<results> recrem_timing_check_716_717_718
%type<results> recrem_timing_check_716_717
%type<results> recrem_timing_check_716
%type<results> skew_timing_check_726_726
%type<results> skew_timing_check_726
%type<results> timeskew_timing_check_728_728
%type<results> timeskew_timing_check_728_729_729
%type<results> timeskew_timing_check_728_729_730_730
%type<results> timeskew_timing_check_728_729_730
%type<results> timeskew_timing_check_728_729
%type<results> timeskew_timing_check_728
%type<results> fullskew_timing_check_734_734
%type<results> fullskew_timing_check_734_735_735
%type<results> fullskew_timing_check_734_735_736_736
%type<results> fullskew_timing_check_734_735_736
%type<results> fullskew_timing_check_734_735
%type<results> fullskew_timing_check_734
%type<results> period_timing_check_740_740
%type<results> period_timing_check_740
%type<results> width_timing_check_742_742
%type<results> width_timing_check_742
%type<results> nochange_timing_check_744_744
%type<results> nochange_timing_check_744
%type<results> timing_check_event_746
%type<results> timing_check_event_747
%type<results> controlled_timing_check_event_748
%type<results> edge_control_specifier_749
%type<results> concatenation_750
%type<results> constant_concatenation_751
%type<results> module_path_concatenation_752
%type<results> streaming_concatenation_753
%type<results> stream_concatenation_754
%type<results> stream_expression_755
%type<results> tf_call_756
%type<results> tf_call_757
%type<results> system_tf_call_758
%type<results> system_tf_call_759
%type<results> subroutine_call_760
%type<results> list_of_arguments_761
%type<results> list_of_arguments_762_762
%type<results> list_of_arguments_762
%type<results> list_of_arguments_764_764
%type<results> list_of_arguments_764
%type<results> list_of_arguments_766
%type<results> list_of_arguments_767_767
%type<results> list_of_arguments_767
%type<results> method_call_body_769
%type<results> method_call_body_770
%type<results> array_manipulation_call_771
%type<results> array_manipulation_call_772
%type<results> array_manipulation_call_773
%type<results> randomize_call_774
%type<results> randomize_call_775_775
%type<results> randomize_call_775
%type<results> randomize_call_777_777_777
%type<results> randomize_call_777_777
%type<results> randomize_call_777
%type<results> inc_or_dec_expression_780
%type<results> inc_or_dec_expression_781
%type<results> conditional_expression_782
%type<results> constant_expression_783
%type<results> constant_expression_784
%type<results> constant_expression_785
%type<results> expression_786
%type<results> expression_787
%type<results> tagged_union_expression_788
%type<results> module_path_conditional_expression_789
%type<results> module_path_expression_790
%type<results> module_path_expression_791
%type<results> constant_primary_792
%type<results> constant_primary_793
%type<results> constant_primary_794
%type<results> constant_primary_795
%type<results> primary_796
%type<results> primary_797
%type<results> primary_798
%type<results> class_qualifier_799
%type<results> class_qualifier_800
%type<results> bit_select_801
%type<results> select_802_802
%type<results> select_802
%type<results> select_804
%type<results> nonrange_select_805_805
%type<results> nonrange_select_805
%type<results> constant_bit_select_807
%type<results> constant_select_808_808
%type<results> constant_select_808
%type<results> constant_select_810
%type<results> net_lvalue_811
%type<results> net_lvalue_812
%type<results> variable_lvalue_813
%type<results> variable_lvalue_814
%type<results> variable_lvalue_815
%type<results> nonrange_variable_lvalue_816
%type<results> attribute_instance_817
%type<results> attr_spec_818
%type<results> hierarchical_identifier_819
%type<results> hierarchical_identifier_820
%type<results> ps_class_identifier_821
%type<results> ps_covergroup_identifier_822
%type<results> ps_checker_identifier_823
%type<results> ps_identifier_824
%type<results> ps_or_hierarchical_array_identifier_825
%type<results> ps_or_hierarchical_net_identifier_826
%type<results> ps_or_hierarchical_property_identifier_827
%type<results> ps_or_hierarchical_sequence_identifier_828
%type<results> ps_or_hierarchical_tf_identifier_829
%type<results> ps_parameter_identifier_830
%type<results> ps_parameter_identifier_831_831
%type<results> ps_parameter_identifier_831
%type<results> ps_type_identifier_833
%type<results> c_identifier
%type<results> escaped_identifier
%type<results> file_path_spec
%type<results> simple_identifier
%type<results> string_literal
%type<results> system_tf_identifier
%type<results> fixed_point_number
%type<results> integral_number
%type<results> real_number
%type<results> unbased_unsized_literal
%type<results> unsigned_number

%%

text: library_text | source_text ;

library_text:
library_text_0
;

library_description:
library_declaration
| include_statement
| config_declaration
| ';' { C($$); T($$, @1, zero, zero); }
;

library_declaration:
LIBRARY_ library_identifier file_path_spec library_declaration_1 library_declaration_2 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

include_statement:
INCLUDE_ file_path_spec ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

source_text:
source_text_4 source_text_5 { $$ = $1; P($$, $2); }
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

module_nonansi_header:
module_nonansi_header_8 module_keyword module_nonansi_header_9 module_identifier module_nonansi_header_10 module_nonansi_header_11 list_of_ports ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

module_ansi_header:
module_ansi_header_12 module_keyword module_ansi_header_13 module_identifier module_ansi_header_14 module_ansi_header_15 module_ansi_header_16 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

module_declaration:
module_nonansi_header module_declaration_17 module_declaration_18 ENDMODULE_ module_declaration_19 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| module_ansi_header module_declaration_20 module_declaration_21 ENDMODULE_ module_declaration_22 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| module_declaration_23 module_keyword module_declaration_24 module_identifier '(' DOTS ')' ';' module_declaration_25 module_declaration_26 ENDMODULE_ module_declaration_27 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); T($$, @7, zero, zero); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); P($$, $12); }
| EXTERN_ module_nonansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
| EXTERN_ module_ansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
;

module_keyword:
MODULE_ { C($$); T($$, @1, zero, zero); }
| MACROMODULE_ { C($$); T($$, @1, zero, zero); }
;

interface_declaration:
interface_nonansi_header interface_declaration_28 interface_declaration_29 ENDINTERFACE_ interface_declaration_30 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| interface_ansi_header interface_declaration_31 interface_declaration_32 ENDINTERFACE_ interface_declaration_33 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| interface_declaration_34 INTERFACE_ interface_identifier '(' DOTS ')' ';' interface_declaration_35 interface_declaration_36 ENDINTERFACE_ interface_declaration_37 { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); T($$, @5, zero, zero); T($$, @6, zero, zero); T($$, @7, zero, zero); P($$, $8); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
| EXTERN_ interface_nonansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
| EXTERN_ interface_ansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
| interface_class_declaration
;

interface_nonansi_header:
interface_nonansi_header_38 INTERFACE_ interface_nonansi_header_39 interface_identifier interface_nonansi_header_40 interface_nonansi_header_41 list_of_ports ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

interface_ansi_header:
interface_ansi_header_42 INTERFACE_ interface_ansi_header_43 interface_identifier interface_ansi_header_44 interface_ansi_header_45 interface_ansi_header_46 ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

program_declaration:
program_nonansi_header program_declaration_47 program_declaration_48 ENDPROGRAM_ program_declaration_49 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| program_ansi_header program_declaration_50 program_declaration_51 ENDPROGRAM_ program_declaration_52 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| program_declaration_53 PROGRAM_ program_identifier '(' DOTS ')' ';' program_declaration_54 program_declaration_55 ENDPROGRAM_ program_declaration_56 { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); T($$, @5, zero, zero); T($$, @6, zero, zero); T($$, @7, zero, zero); P($$, $8); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
| EXTERN_ program_nonansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
| EXTERN_ program_ansi_header { C($$); T($$, @1, zero, zero); P($$, $2); }
;

program_nonansi_header:
program_nonansi_header_57 PROGRAM_ program_nonansi_header_58 program_identifier program_nonansi_header_59 program_nonansi_header_60 list_of_ports ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

program_ansi_header:
program_ansi_header_61 PROGRAM_ program_ansi_header_62 program_identifier program_ansi_header_63 program_ansi_header_64 program_ansi_header_65 ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
;

checker_declaration:
CHECKER_ checker_identifier checker_declaration_66 ';' checker_declaration_68 ENDCHECKER_ checker_declaration_70 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); }
;

class_declaration:
class_declaration_71 CLASS_ class_declaration_72 class_identifier class_declaration_73 class_declaration_74 class_declaration_76 ';' class_declaration_78 ENDCLASS_ class_declaration_79 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
;

interface_class_type:
ps_class_identifier interface_class_type_80 { $$ = $1; P($$, $2); }
;

interface_class_declaration:
INTERFACE_ CLASS_ class_identifier interface_class_declaration_81 interface_class_declaration_82 ';' interface_class_declaration_84 ENDCLASS_ interface_class_declaration_85 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

interface_class_item:
type_declaration
| interface_class_item_86 interface_class_method { $$ = $1; P($$, $2); }
| local_parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| ';' { C($$); T($$, @1, zero, zero); }
;

interface_class_method:
PURE_ VIRTUAL_ method_prototype ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

package_declaration:
package_declaration_87 PACKAGE_ package_declaration_88 package_identifier ';' package_declaration_89 package_declaration_90 ENDPACKAGE_ package_declaration_92 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

timeunits_declaration:
TIMEUNIT_ time_literal timeunits_declaration_93 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| TIMEPRECISION_ time_literal ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| TIMEUNIT_ time_literal ';' TIMEPRECISION_ time_literal ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
| TIMEPRECISION_ time_literal ';' TIMEUNIT_ time_literal ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

parameter_port_list:
'#' '(' list_of_param_assignments parameter_port_list_94 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| '#' '(' parameter_port_declaration parameter_port_list_95 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| '#' '(' ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

parameter_port_declaration:
parameter_declaration
| local_parameter_declaration
| data_type list_of_param_assignments { $$ = $1; P($$, $2); }
| TYPE_ list_of_type_assignments { C($$); T($$, @1, zero, zero); P($$, $2); }
;

list_of_ports:
'(' port list_of_ports_96 ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

list_of_port_declarations:
'(' list_of_port_declarations_97 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

port_declaration:
port_declaration_101 inout_declaration { $$ = $1; P($$, $2); }
| port_declaration_102 input_declaration { $$ = $1; P($$, $2); }
| port_declaration_103 output_declaration { $$ = $1; P($$, $2); }
| port_declaration_104 ref_declaration { $$ = $1; P($$, $2); }
| port_declaration_105 interface_port_declaration { $$ = $1; P($$, $2); }
;

port:
port_106
| '.' port_identifier '(' port_107 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

port_expression:
port_reference
| '{' port_reference port_expression_108 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

port_reference:
port_identifier constant_select { $$ = $1; P($$, $2); }
;

port_direction:
INPUT_ { C($$); T($$, @1, zero, zero); }
| OUTPUT_ { C($$); T($$, @1, zero, zero); }
| INOUT_ { C($$); T($$, @1, zero, zero); }
| REF_ { C($$); T($$, @1, zero, zero); }
;

net_port_header:
net_port_header_109 net_port_type { $$ = $1; P($$, $2); }
;

variable_port_header:
variable_port_header_110 variable_port_type { $$ = $1; P($$, $2); }
;

interface_port_header:
interface_identifier interface_port_header_111 { $$ = $1; P($$, $2); }
| INTERFACE_ interface_port_header_112 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

ansi_port_declaration:
ansi_port_declaration_113 port_identifier ansi_port_declaration_114 ansi_port_declaration_115 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| ansi_port_declaration_116 port_identifier ansi_port_declaration_117 ansi_port_declaration_118 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| ansi_port_declaration_119 '.' port_identifier '(' ansi_port_declaration_120 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

elaboration_system_task:
Dfatal elaboration_system_task_121 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| Derror elaboration_system_task_123 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| Dwarning elaboration_system_task_125 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| Dinfo elaboration_system_task_127 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

finish_number:
'0' { C($$); T($$, @1, zero, zero); }
| '1' { C($$); T($$, @1, zero, zero); }
| '2' { C($$); T($$, @1, zero, zero); }
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

module_item:
port_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| non_port_module_item
;

module_or_generate_item:
module_or_generate_item_129 parameter_override { $$ = $1; P($$, $2); }
| module_or_generate_item_130 gate_instantiation { $$ = $1; P($$, $2); }
| module_or_generate_item_131 udp_instantiation { $$ = $1; P($$, $2); }
| module_or_generate_item_132 module_instantiation { $$ = $1; P($$, $2); }
| module_or_generate_item_133 module_common_item { $$ = $1; P($$, $2); }
;

module_or_generate_item_declaration:
package_or_generate_item_declaration
| genvar_declaration
| clocking_declaration
| DEFAULT_ CLOCKING_ clocking_identifier ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| DEFAULT_ DISABLE_ IFF_ expression_or_dist ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

non_port_module_item:
generate_region
| module_or_generate_item
| specify_block
| non_port_module_item_134 specparam_declaration { $$ = $1; P($$, $2); }
| program_declaration
| module_declaration
| interface_declaration
| timeunits_declaration
;

parameter_override:
DEFPARAM_ list_of_defparam_assignments ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

bind_directive:
BIND_ bind_target_scope bind_directive_135 bind_instantiation ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| BIND_ bind_target_instance bind_instantiation ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

bind_target_scope:
module_identifier
| interface_identifier
;

bind_target_instance:
hierarchical_identifier constant_bit_select { $$ = $1; P($$, $2); }
;

bind_target_instance_list:
bind_target_instance bind_target_instance_list_136 { $$ = $1; P($$, $2); }
;

bind_instantiation:
program_instantiation
| module_instantiation
| interface_instantiation
| checker_instantiation
;

config_declaration:
CONFIG_ config_identifier ';' config_declaration_137 design_statement config_declaration_138 ENDCONFIG_ config_declaration_139 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
;

design_statement:
DESIGN_ design_statement_140 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

config_rule_statement:
default_clause liblist_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| inst_clause liblist_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| inst_clause use_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| cell_clause liblist_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| cell_clause use_clause ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

default_clause:
DEFAULT_ { C($$); T($$, @1, zero, zero); }
;

inst_clause:
INSTANCE_ inst_name { C($$); T($$, @1, zero, zero); P($$, $2); }
;

inst_name:
topmodule_identifier inst_name_142 { $$ = $1; P($$, $2); }
;

cell_clause:
CELL_ cell_clause_143 cell_identifier { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

liblist_clause:
LIBLIST_ liblist_clause_144 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

use_clause:
USE_ use_clause_145 cell_identifier use_clause_146 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); }
| USE_ named_parameter_assignment use_clause_147 use_clause_148 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); }
| USE_ use_clause_149 cell_identifier named_parameter_assignment use_clause_150 use_clause_151 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

interface_or_generate_item:
interface_or_generate_item_152 module_common_item { $$ = $1; P($$, $2); }
| interface_or_generate_item_153 modport_declaration { $$ = $1; P($$, $2); }
| interface_or_generate_item_154 extern_tf_declaration { $$ = $1; P($$, $2); }
;

extern_tf_declaration:
EXTERN_ method_prototype ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| EXTERN_ FORKJOIN_ task_prototype ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

interface_item:
port_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| non_port_interface_item
;

non_port_interface_item:
generate_region
| interface_or_generate_item
| program_declaration
| interface_declaration
| timeunits_declaration
;

program_item:
port_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| non_port_program_item
;

non_port_program_item:
non_port_program_item_155 continuous_assign { $$ = $1; P($$, $2); }
| non_port_program_item_156 module_or_generate_item_declaration { $$ = $1; P($$, $2); }
| non_port_program_item_157 initial_construct { $$ = $1; P($$, $2); }
| non_port_program_item_158 final_construct { $$ = $1; P($$, $2); }
| non_port_program_item_159 concurrent_assertion_item { $$ = $1; P($$, $2); }
| timeunits_declaration
| program_generate_item
;

program_generate_item:
loop_generate_construct
| conditional_generate_construct
| generate_region
| elaboration_system_task
;

checker_port_list:
checker_port_item checker_port_list_160 { $$ = $1; P($$, $2); }
;

checker_port_item:
checker_port_item_161 checker_port_item_162 property_formal_type formal_port_identifier checker_port_item_163 checker_port_item_164 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

checker_port_direction:
INPUT_ { C($$); T($$, @1, zero, zero); }
| OUTPUT_ { C($$); T($$, @1, zero, zero); }
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
checker_or_generate_item_declaration_165 data_declaration { $$ = $1; P($$, $2); }
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

checker_generate_item:
loop_generate_construct
| conditional_generate_construct
| generate_region
| elaboration_system_task
;

class_item:
class_item_166 class_property { $$ = $1; P($$, $2); }
| class_item_167 class_method { $$ = $1; P($$, $2); }
| class_item_168 class_constraint { $$ = $1; P($$, $2); }
| class_item_169 class_declaration { $$ = $1; P($$, $2); }
| class_item_170 covergroup_declaration { $$ = $1; P($$, $2); }
| local_parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| parameter_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| ';' { C($$); T($$, @1, zero, zero); }
;

class_property:
class_property_171 data_declaration { $$ = $1; P($$, $2); }
| CONST_ class_property_172 data_type const_identifier class_property_173 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

class_method:
class_method_174 task_declaration { $$ = $1; P($$, $2); }
| class_method_175 function_declaration { $$ = $1; P($$, $2); }
| PURE_ VIRTUAL_ class_method_176 method_prototype ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| EXTERN_ class_method_177 method_prototype ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| class_method_178 class_constructor_declaration { $$ = $1; P($$, $2); }
| EXTERN_ class_method_179 class_constructor_prototype { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

class_constructor_prototype:
FUNCTION_ NEW_ class_constructor_prototype_180 ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

class_constraint:
constraint_prototype
| constraint_declaration
;

class_item_qualifier:
STATIC_ { C($$); T($$, @1, zero, zero); }
| PROTECTED_ { C($$); T($$, @1, zero, zero); }
| LOCAL_ { C($$); T($$, @1, zero, zero); }
;

property_qualifier:
random_qualifier
| class_item_qualifier
;

random_qualifier:
RAND_ { C($$); T($$, @1, zero, zero); }
| RANDC_ { C($$); T($$, @1, zero, zero); }
;

method_qualifier:
method_qualifier_182 VIRTUAL_ { $$ = $1; T($$, @2, zero, zero); }
| class_item_qualifier
;

method_prototype:
task_prototype
| function_prototype
;

class_constructor_declaration:
FUNCTION_ class_constructor_declaration_183 NEW_ class_constructor_declaration_184 ';' class_constructor_declaration_186 class_constructor_declaration_187 class_constructor_declaration_189 ENDFUNCTION_ class_constructor_declaration_190 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); P($$, $8); T($$, @9, zero, zero); P($$, $10); }
;

constraint_declaration:
constraint_declaration_191 CONSTRAINT_ constraint_identifier constraint_block { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

constraint_block:
'{' constraint_block_192 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

constraint_block_item:
SOLVE_ solve_before_list BEFORE_ solve_before_list ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| constraint_expression
;

solve_before_list:
constraint_primary solve_before_list_193 { $$ = $1; P($$, $2); }
;

constraint_primary:
constraint_primary_194 hierarchical_identifier select { $$ = $1; P($$, $2); P($$, $3); }
;

constraint_expression:
constraint_expression_195 expression_or_dist ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| uniqueness_constraint ';' { $$ = $1; T($$, @2, zero, zero); }
| expression MG constraint_set { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| IF_ '(' expression ')' constraint_set constraint_expression_196 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
| FOREACH_ '(' ps_or_hierarchical_array_identifier constraint_expression_197 ')' constraint_set { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| DISABLE_ SOFT_ constraint_primary ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

uniqueness_constraint:
UNIQUE_ '{' open_range_list '}' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

constraint_set:
constraint_expression
| '{' constraint_set_198 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

dist_list:
dist_item dist_list_199 { $$ = $1; P($$, $2); }
;

dist_item:
value_range dist_item_200 { $$ = $1; P($$, $2); }
;

dist_weight:
CE expression { C($$); T($$, @1, zero, zero); P($$, $2); }
| CV expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

constraint_prototype:
constraint_prototype_201 constraint_prototype_202 CONSTRAINT_ constraint_identifier ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

constraint_prototype_qualifier:
EXTERN_ { C($$); T($$, @1, zero, zero); }
| PURE_ { C($$); T($$, @1, zero, zero); }
;

extern_constraint_declaration:
extern_constraint_declaration_203 CONSTRAINT_ class_scope constraint_identifier constraint_block { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

identifier_list:
identifier identifier_list_204 { $$ = $1; P($$, $2); }
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

anonymous_program:
PROGRAM_ ';' anonymous_program_205 ENDPROGRAM_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

anonymous_program_item:
task_declaration
| function_declaration
| class_declaration
| covergroup_declaration
| class_constructor_declaration
| ';' { C($$); T($$, @1, zero, zero); }
;

local_parameter_declaration:
LOCALPARAM_ data_type_or_implicit list_of_param_assignments { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| LOCALPARAM_ TYPE_ list_of_type_assignments { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); }
;

parameter_declaration:
PARAMETER_ data_type_or_implicit list_of_param_assignments { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| PARAMETER_ TYPE_ list_of_type_assignments { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); }
;

specparam_declaration:
SPECPARAM_ specparam_declaration_206 list_of_specparam_assignments ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

inout_declaration:
INOUT_ net_port_type list_of_port_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

input_declaration:
INPUT_ net_port_type list_of_port_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| INPUT_ variable_port_type list_of_variable_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

output_declaration:
OUTPUT_ net_port_type list_of_port_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| OUTPUT_ variable_port_type list_of_variable_port_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

interface_port_declaration:
interface_identifier list_of_interface_identifiers { $$ = $1; P($$, $2); }
| interface_identifier '.' modport_identifier list_of_interface_identifiers { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

ref_declaration:
REF_ variable_port_type list_of_variable_identifiers { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

data_declaration:
data_declaration_207 data_declaration_208 data_declaration_209 data_type_or_implicit list_of_variable_decl_assignments ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| type_declaration
| package_import_declaration net_type_declaration { $$ = $1; P($$, $2); }
;

package_import_declaration:
IMPORT_ package_import_item package_import_declaration_210 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

package_import_item:
package_identifier CC identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| package_identifier CC '*' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

package_export_declaration:
EXPORT_ SCCS ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
| EXPORT_ package_import_item package_export_declaration_211 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

genvar_declaration:
GENVAR_ list_of_genvar_identifiers ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

net_declaration:
net_type net_declaration_212 net_declaration_213 data_type_or_implicit net_declaration_214 list_of_net_decl_assignments ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
| net_type_identifier net_declaration_215 list_of_net_decl_assignments ';' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| INTERCONNECT_ implicit_data_type net_declaration_216 net_identifier net_declaration_217 net_declaration_218 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

type_declaration:
TYPEDEF_ data_type type_identifier type_declaration_220 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| TYPEDEF_ interface_instance_identifier constant_bit_select '.' type_identifier type_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
| TYPEDEF_ type_declaration_221 type_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

net_type_declaration:
NETTYPE_ data_type net_type_identifier net_type_declaration_222 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| NETTYPE_ net_type_declaration_224 net_type_identifier net_type_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

lifetime:
STATIC_ { C($$); T($$, @1, zero, zero); }
| AUTOMATIC_ { C($$); T($$, @1, zero, zero); }
;

casting_type:
simple_type
| constant_primary
| signing
| STRING_ { C($$); T($$, @1, zero, zero); }
| CONST_ { C($$); T($$, @1, zero, zero); }
;

data_type:
integer_vector_type data_type_225 data_type_226 { $$ = $1; P($$, $2); P($$, $3); }
| integer_atom_type data_type_227 { $$ = $1; P($$, $2); }
| non_integer_type
| struct_union data_type_228 '{' struct_union_member data_type_230 '}' data_type_231 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); P($$, $7); }
| ENUM_ data_type_232 '{' enum_name_declaration data_type_233 '}' data_type_234 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); P($$, $7); }
| STRING_ { C($$); T($$, @1, zero, zero); }
| CHANDLE_ { C($$); T($$, @1, zero, zero); }
| VIRTUAL_ data_type_235 interface_identifier data_type_236 data_type_237 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); }
| data_type_238 type_identifier data_type_239 { $$ = $1; P($$, $2); P($$, $3); }
| class_type
| EVENT_ { C($$); T($$, @1, zero, zero); }
| ps_covergroup_identifier
| type_reference
;

data_type_or_implicit:
data_type
| implicit_data_type
;

implicit_data_type:
implicit_data_type_240 implicit_data_type_241 { $$ = $1; P($$, $2); }
;

enum_base_type:
integer_atom_type enum_base_type_242 { $$ = $1; P($$, $2); }
| integer_vector_type enum_base_type_243 enum_base_type_244 { $$ = $1; P($$, $2); P($$, $3); }
| type_identifier enum_base_type_245 { $$ = $1; P($$, $2); }
;

enum_name_declaration:
enum_identifier enum_name_declaration_246 enum_name_declaration_248 { $$ = $1; P($$, $2); P($$, $3); }
;

class_scope:
class_type CC { $$ = $1; T($$, @2, zero, zero); }
;

class_type:
ps_class_identifier class_type_249 class_type_250 { $$ = $1; P($$, $2); P($$, $3); }
;

integer_type:
integer_vector_type
| integer_atom_type
;

integer_atom_type:
BYTE_ { C($$); T($$, @1, zero, zero); }
| SHORTINT_ { C($$); T($$, @1, zero, zero); }
| INT_ { C($$); T($$, @1, zero, zero); }
| LONGINT_ { C($$); T($$, @1, zero, zero); }
| INTEGER_ { C($$); T($$, @1, zero, zero); }
| TIME_ { C($$); T($$, @1, zero, zero); }
;

integer_vector_type:
BIT_ { C($$); T($$, @1, zero, zero); }
| LOGIC_ { C($$); T($$, @1, zero, zero); }
| REG_ { C($$); T($$, @1, zero, zero); }
;

non_integer_type:
SHORTREAL_ { C($$); T($$, @1, zero, zero); }
| REAL_ { C($$); T($$, @1, zero, zero); }
| REALTIME_ { C($$); T($$, @1, zero, zero); }
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

net_port_type:
net_port_type_252 data_type_or_implicit { $$ = $1; P($$, $2); }
| net_type_identifier
| INTERCONNECT_ implicit_data_type { C($$); T($$, @1, zero, zero); P($$, $2); }
;

variable_port_type:
var_data_type
;

var_data_type:
data_type
| VAR_ data_type_or_implicit { C($$); T($$, @1, zero, zero); P($$, $2); }
;

signing:
SIGNED_ { C($$); T($$, @1, zero, zero); }
| UNSIGNED_ { C($$); T($$, @1, zero, zero); }
;

simple_type:
integer_type
| non_integer_type
| ps_type_identifier
| ps_parameter_identifier
;

struct_union_member:
struct_union_member_253 struct_union_member_254 data_type_or_void list_of_variable_decl_assignments ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

data_type_or_void:
data_type
| VOID_ { C($$); T($$, @1, zero, zero); }
;

struct_union:
STRUCT_ { C($$); T($$, @1, zero, zero); }
| UNION_ struct_union_255 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

type_reference:
TYPE_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| TYPE_ '(' data_type ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

drive_strength:
'(' strength0 ',' strength1 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' strength1 ',' strength0 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' strength0 ',' HIGHZ1_ ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); T($$, @5, zero, zero); }
| '(' strength1 ',' HIGHZ0_ ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); T($$, @5, zero, zero); }
| '(' HIGHZ0_ ',' strength1 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| '(' HIGHZ1_ ',' strength0 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
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

charge_strength:
'(' SMALL_ ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
| '(' MEDIUM_ ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
| '(' LARGE_ ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

delay3:
'#' delay_value { C($$); T($$, @1, zero, zero); P($$, $2); }
| '#' '(' mintypmax_expression delay3_256 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

delay2:
'#' delay_value { C($$); T($$, @1, zero, zero); P($$, $2); }
| '#' '(' mintypmax_expression delay2_258 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

delay_value:
unsigned_number
| real_number
| ps_identifier
| time_literal
| _1step { C($$); T($$, @1, zero, zero); }
;

list_of_defparam_assignments:
defparam_assignment list_of_defparam_assignments_259 { $$ = $1; P($$, $2); }
;

list_of_genvar_identifiers:
genvar_identifier list_of_genvar_identifiers_260 { $$ = $1; P($$, $2); }
;

list_of_interface_identifiers:
interface_identifier list_of_interface_identifiers_261 list_of_interface_identifiers_262 { $$ = $1; P($$, $2); P($$, $3); }
;

list_of_net_decl_assignments:
net_decl_assignment list_of_net_decl_assignments_264 { $$ = $1; P($$, $2); }
;

list_of_param_assignments:
param_assignment list_of_param_assignments_265 { $$ = $1; P($$, $2); }
;

list_of_port_identifiers:
port_identifier list_of_port_identifiers_266 list_of_port_identifiers_267 { $$ = $1; P($$, $2); P($$, $3); }
;

list_of_udp_port_identifiers:
port_identifier list_of_udp_port_identifiers_269 { $$ = $1; P($$, $2); }
;

list_of_specparam_assignments:
specparam_assignment list_of_specparam_assignments_270 { $$ = $1; P($$, $2); }
;

list_of_tf_variable_identifiers:
port_identifier list_of_tf_variable_identifiers_271 list_of_tf_variable_identifiers_272 list_of_tf_variable_identifiers_273 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
;

list_of_type_assignments:
type_assignment list_of_type_assignments_276 { $$ = $1; P($$, $2); }
;

list_of_variable_decl_assignments:
variable_decl_assignment list_of_variable_decl_assignments_277 { $$ = $1; P($$, $2); }
;

list_of_variable_identifiers:
variable_identifier list_of_variable_identifiers_278 list_of_variable_identifiers_279 { $$ = $1; P($$, $2); P($$, $3); }
;

list_of_variable_port_identifiers:
port_identifier list_of_variable_port_identifiers_281 list_of_variable_port_identifiers_282 list_of_variable_port_identifiers_283 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
;

defparam_assignment:
hierarchical_parameter_identifier '=' constant_mintypmax_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

net_decl_assignment:
net_identifier net_decl_assignment_286 net_decl_assignment_287 { $$ = $1; P($$, $2); P($$, $3); }
;

param_assignment:
parameter_identifier param_assignment_288 param_assignment_289 { $$ = $1; P($$, $2); P($$, $3); }
;

specparam_assignment:
specparam_identifier '=' constant_mintypmax_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| pulse_control_specparam
;

type_assignment:
type_identifier type_assignment_290 { $$ = $1; P($$, $2); }
;

pulse_control_specparam:
PATHPULSED '=' '(' reject_limit_value pulse_control_specparam_291 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| PATHPULSED specify_input_terminal_descriptor '$' specify_output_terminal_descriptor '=' '(' reject_limit_value pulse_control_specparam_292 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); }
;

error_limit_value:
limit_value
;

reject_limit_value:
limit_value
;

limit_value:
constant_mintypmax_expression
;

variable_decl_assignment:
variable_identifier variable_decl_assignment_293 variable_decl_assignment_294 { $$ = $1; P($$, $2); P($$, $3); }
| dynamic_array_variable_identifier unsized_dimension variable_decl_assignment_295 variable_decl_assignment_296 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| class_variable_identifier variable_decl_assignment_297 { $$ = $1; P($$, $2); }
;

class_new:
class_new_298 NEW_ class_new_299 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| NEW_ expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

dynamic_array_new:
NEW_ '[' expression ']' dynamic_array_new_300 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

unpacked_dimension:
'[' constant_range ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| '[' constant_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

packed_dimension:
'[' constant_range ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| unsized_dimension
;

associative_dimension:
'[' data_type ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| '[' '*' ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

variable_dimension:
unsized_dimension
| unpacked_dimension
| associative_dimension
| queue_dimension
;

queue_dimension:
'[' '$' queue_dimension_301 ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

unsized_dimension:
'[' ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

function_data_type_or_implicit:
data_type_or_void
| implicit_data_type
;

function_declaration:
FUNCTION_ function_declaration_302 function_body_declaration { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

function_body_declaration:
function_data_type_or_implicit function_body_declaration_303 function_identifier ';' function_body_declaration_304 function_body_declaration_305 ENDFUNCTION_ function_body_declaration_306 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
| function_data_type_or_implicit function_body_declaration_307 function_identifier '(' function_body_declaration_308 ')' ';' function_body_declaration_309 function_body_declaration_310 ENDFUNCTION_ function_body_declaration_311 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); P($$, $8); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
;

function_prototype:
FUNCTION_ data_type_or_void function_identifier function_prototype_312 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); }
;

dpi_import_export:
IMPORT_ dpi_spec_string dpi_import_export_314 dpi_import_export_315 dpi_function_proto ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| IMPORT_ dpi_spec_string dpi_import_export_316 dpi_import_export_317 dpi_task_proto ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| EXPORT_ dpi_spec_string dpi_import_export_318 FUNCTION_ function_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
| EXPORT_ dpi_spec_string dpi_import_export_319 TASK_ task_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

dpi_spec_string:
DPIMC { C($$); T($$, @1, zero, zero); }
| DPI { C($$); T($$, @1, zero, zero); }
;

dpi_function_import_property:
CONTEXT_ { C($$); T($$, @1, zero, zero); }
| PURE_ { C($$); T($$, @1, zero, zero); }
;

dpi_task_import_property:
CONTEXT_ { C($$); T($$, @1, zero, zero); }
;

dpi_function_proto:
function_prototype
;

dpi_task_proto:
task_prototype
;

task_declaration:
TASK_ task_declaration_320 task_body_declaration { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

task_body_declaration:
task_body_declaration_321 task_identifier ';' task_body_declaration_322 task_body_declaration_323 ENDTASK_ task_body_declaration_324 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); P($$, $7); }
| task_body_declaration_325 task_identifier '(' task_body_declaration_326 ')' ';' task_body_declaration_327 task_body_declaration_328 ENDTASK_ task_body_declaration_329 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); P($$, $10); }
;

tf_item_declaration:
block_item_declaration
| tf_port_declaration
;

tf_port_list:
tf_port_item tf_port_list_330 { $$ = $1; P($$, $2); }
;

tf_port_item:
tf_port_item_331 tf_port_item_332 tf_port_item_333 data_type_or_implicit tf_port_item_334 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); }
;

tf_port_direction:
port_direction
| CONST_ REF_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

tf_port_declaration:
tf_port_declaration_337 tf_port_direction tf_port_declaration_338 data_type_or_implicit list_of_tf_variable_identifiers ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

task_prototype:
TASK_ task_identifier task_prototype_339 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

block_item_declaration:
block_item_declaration_341 data_declaration { $$ = $1; P($$, $2); }
| block_item_declaration_342 local_parameter_declaration ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| block_item_declaration_343 parameter_declaration ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| block_item_declaration_344 overload_declaration { $$ = $1; P($$, $2); }
| block_item_declaration_345 let_declaration { $$ = $1; P($$, $2); }
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
data_type overload_proto_formals_346 { $$ = $1; P($$, $2); }
;

modport_declaration:
MODPORT_ modport_item modport_declaration_347 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

modport_item:
modport_identifier '(' modport_ports_declaration modport_item_348 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

modport_ports_declaration:
modport_ports_declaration_349 modport_simple_ports_declaration { $$ = $1; P($$, $2); }
| modport_ports_declaration_350 modport_tf_ports_declaration { $$ = $1; P($$, $2); }
| modport_ports_declaration_351 modport_clocking_declaration { $$ = $1; P($$, $2); }
;

modport_clocking_declaration:
CLOCKING_ clocking_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

modport_simple_ports_declaration:
port_direction modport_simple_port modport_simple_ports_declaration_352 { $$ = $1; P($$, $2); P($$, $3); }
;

modport_simple_port:
port_identifier
| '.' port_identifier '(' modport_simple_port_353 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

modport_tf_ports_declaration:
import_export modport_tf_port modport_tf_ports_declaration_354 { $$ = $1; P($$, $2); P($$, $3); }
;

modport_tf_port:
method_prototype
| tf_identifier
;

import_export:
IMPORT_ { C($$); T($$, @1, zero, zero); }
| EXPORT_ { C($$); T($$, @1, zero, zero); }
;

concurrent_assertion_item:
concurrent_assertion_item_355 concurrent_assertion_statement { $$ = $1; P($$, $2); }
| checker_instantiation
;

concurrent_assertion_statement:
assert_property_statement
| assume_property_statement
| cover_property_statement
| cover_sequence_statement
| restrict_property_statement
;

assert_property_statement:
ASSERT_ PROPERTY_ '(' property_spec ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

assume_property_statement:
ASSUME_ PROPERTY_ '(' property_spec ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

cover_property_statement:
COVER_ PROPERTY_ '(' property_spec ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

expect_property_statement:
EXPECT_ '(' property_spec ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

cover_sequence_statement:
COVER_ SEQUENCE_ '(' cover_sequence_statement_356 cover_sequence_statement_357 sequence_expr ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); P($$, $5); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
;

restrict_property_statement:
RESTRICT_ PROPERTY_ '(' property_spec ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); }
;

property_instance:
ps_or_hierarchical_property_identifier property_instance_358 { $$ = $1; P($$, $2); }
;

property_list_of_arguments:
property_list_of_arguments_360 property_list_of_arguments_361 property_list_of_arguments_363 { $$ = $1; P($$, $2); P($$, $3); }
| '.' identifier '(' property_list_of_arguments_365 ')' property_list_of_arguments_366 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

property_actual_arg:
property_expr
| sequence_actual_arg
;

assertion_item_declaration:
property_declaration
| sequence_declaration
| let_declaration
;

property_declaration:
PROPERTY_ property_identifier property_declaration_368 ';' property_declaration_370 property_spec property_declaration_371 ENDPROPERTY_ property_declaration_372 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

property_port_list:
property_port_item property_port_list_373 { $$ = $1; P($$, $2); }
;

property_port_item:
property_port_item_374 property_port_item_375 property_formal_type formal_port_identifier property_port_item_377 property_port_item_378 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

property_lvar_port_direction:
INPUT_ { C($$); T($$, @1, zero, zero); }
;

property_formal_type:
sequence_formal_type
| PROPERTY_ { C($$); T($$, @1, zero, zero); }
;

property_spec:
property_spec_379 property_spec_380 property_expr { $$ = $1; P($$, $2); P($$, $3); }
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
| IF_ '(' expression_or_dist ')' property_expr property_expr_381 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
| CASE_ '(' expression_or_dist ')' property_case_item property_expr_382 ENDCASE_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
| sequence_expr NMN property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr NEN property_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| NEXTTIME_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| NEXTTIME_ property_expr_383 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| S_NEXTTIME_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| S_NEXTTIME_ property_expr_384 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| ALWAYS_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| ALWAYS_ property_expr_385 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| S_ALWAYS_ property_expr_386 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| S_EVENTUALLY_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| EVENTUALLY_ property_expr_387 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| S_EVENTUALLY_ property_expr_388 property_expr { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
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

property_case_item:
expression_or_dist property_case_item_389 ':' property_expr property_case_item_390 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); }
| DEFAULT_ property_case_item_391 property_expr property_case_item_392 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); }
;

sequence_declaration:
SEQUENCE_ sequence_identifier sequence_declaration_393 ';' sequence_declaration_395 sequence_expr sequence_declaration_396 ENDSEQUENCE_ sequence_declaration_397 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

sequence_port_list:
sequence_port_item sequence_port_list_398 { $$ = $1; P($$, $2); }
;

sequence_port_item:
sequence_port_item_399 sequence_port_item_400 sequence_formal_type formal_port_identifier sequence_port_item_402 sequence_port_item_403 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

sequence_lvar_port_direction:
INPUT_ { C($$); T($$, @1, zero, zero); }
| INOUT_ { C($$); T($$, @1, zero, zero); }
| OUTPUT_ { C($$); T($$, @1, zero, zero); }
;

sequence_formal_type:
data_type_or_implicit
| SEQUENCE_ { C($$); T($$, @1, zero, zero); }
| UNTYPED_ { C($$); T($$, @1, zero, zero); }
;

sequence_expr:
cycle_delay_range sequence_expr sequence_expr_404 { $$ = $1; P($$, $2); P($$, $3); }
| sequence_expr cycle_delay_range sequence_expr sequence_expr_405 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| expression_or_dist sequence_expr_406 { $$ = $1; P($$, $2); }
| sequence_instance sequence_expr_407 { $$ = $1; P($$, $2); }
| '(' sequence_expr sequence_expr_408 ')' sequence_expr_409 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| sequence_expr AND_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr INTERSECT_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr OR_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| FIRST_MATCH_ '(' sequence_expr sequence_expr_410 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| expression_or_dist THROUGHOUT_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| sequence_expr WITHIN_ sequence_expr { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| clocking_event sequence_expr { $$ = $1; P($$, $2); }
;

cycle_delay_range:
NN constant_primary { C($$); T($$, @1, zero, zero); P($$, $2); }
| NN '[' cycle_delay_const_range_expression ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| NNOSBSCSB { C($$); T($$, @1, zero, zero); }
| NNOSBPLUSCSB { C($$); T($$, @1, zero, zero); }
;

sequence_method_call:
sequence_instance '.' method_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequence_match_item:
operator_assignment
| inc_or_dec_expression
| subroutine_call
;

sequence_instance:
ps_or_hierarchical_sequence_identifier sequence_instance_411 { $$ = $1; P($$, $2); }
;

sequence_list_of_arguments:
sequence_list_of_arguments_413 sequence_list_of_arguments_414 sequence_list_of_arguments_416 { $$ = $1; P($$, $2); P($$, $3); }
| '.' identifier '(' sequence_list_of_arguments_418 ')' sequence_list_of_arguments_419 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

sequence_actual_arg:
event_expression
| sequence_expr
;

boolean_abbrev:
consecutive_repetition
| non_consecutive_repetition
| goto_repetition
;

sequence_abbrev:
consecutive_repetition
;

consecutive_repetition:
OSBS const_or_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| OSBSCSB { C($$); T($$, @1, zero, zero); }
| OSBPLUSCSB { C($$); T($$, @1, zero, zero); }
;

non_consecutive_repetition:
OSBE const_or_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

goto_repetition:
OSBMG const_or_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

const_or_range_expression:
constant_expression
| cycle_delay_const_range_expression
;

cycle_delay_const_range_expression:
constant_expression ':' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| constant_expression ':' '$' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

expression_or_dist:
expression expression_or_dist_421 { $$ = $1; P($$, $2); }
;

assertion_variable_declaration:
var_data_type list_of_variable_decl_assignments ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

let_declaration:
LET_ let_identifier let_declaration_423 '=' expression ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

let_identifier:
identifier
;

let_port_list:
let_port_item let_port_list_425 { $$ = $1; P($$, $2); }
;

let_port_item:
let_port_item_426 let_formal_type formal_port_identifier let_port_item_427 let_port_item_428 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); }
;

let_formal_type:
data_type_or_implicit
| UNTYPED_ { C($$); T($$, @1, zero, zero); }
;

let_expression:
let_expression_429 let_identifier let_expression_430 { $$ = $1; P($$, $2); P($$, $3); }
;

let_list_of_arguments:
let_list_of_arguments_432 let_list_of_arguments_433 let_list_of_arguments_435 { $$ = $1; P($$, $2); P($$, $3); }
| '.' identifier '(' let_list_of_arguments_437 ')' let_list_of_arguments_438 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

let_actual_arg:
expression
;

covergroup_declaration:
COVERGROUP_ covergroup_identifier covergroup_declaration_440 covergroup_declaration_442 ';' covergroup_declaration_443 ENDGROUP_ covergroup_declaration_444 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
;

coverage_spec_or_option:
coverage_spec_or_option_445 coverage_spec { $$ = $1; P($$, $2); }
| coverage_spec_or_option_446 coverage_option ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

coverage_option:
OPTION_ '.' member_identifier '=' expression { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| TYPE_OPTION_ '.' member_identifier '=' constant_expression { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

coverage_spec:
cover_point
| cover_cross
;

coverage_event:
clocking_event
| WITH_ FUNCTION_ SAMPLE_ '(' coverage_event_447 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
| ATAT '(' block_event_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

block_event_expression:
block_event_expression OR_ block_event_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| BEGIN_ hierarchical_btf_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| END_ hierarchical_btf_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

hierarchical_btf_identifier:
hierarchical_tf_identifier
| hierarchical_block_identifier
| hierarchical_btf_identifier_448 method_identifier { $$ = $1; P($$, $2); }
;

cover_point:
cover_point_449 COVERPOINT_ expression cover_point_451 bins_or_empty { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

bins_or_empty:
bins_or_empty_452
| ';' { C($$); T($$, @1, zero, zero); }
;

bins_or_options:
coverage_option
| bins_or_options_455 bins_keyword bin_identifier bins_or_options_456 '=' '{' covergroup_range_list '}' bins_or_options_458 bins_or_options_459 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); }
| bins_or_options_460 bins_keyword bin_identifier bins_or_options_461 '=' cover_point_identifier bins_or_options_463 bins_or_options_464 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); P($$, $8); }
| bins_or_options_465 bins_keyword bin_identifier bins_or_options_466 '=' set_covergroup_expression bins_or_options_468 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); }
| bins_or_options_469 bins_keyword bin_identifier bins_or_options_470 '=' trans_list bins_or_options_471 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); }
| bins_keyword bin_identifier bins_or_options_472 '=' DEFAULT_ bins_or_options_475 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); T($$, @5, zero, zero); P($$, $6); }
| bins_keyword bin_identifier '=' DEFAULT_ SEQUENCE_ bins_or_options_476 { $$ = $1; P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); T($$, @5, zero, zero); P($$, $6); }
;

bins_keyword:
BINS_ { C($$); T($$, @1, zero, zero); }
| ILLEGAL_BINS_ { C($$); T($$, @1, zero, zero); }
| IGNORE_BINS_ { C($$); T($$, @1, zero, zero); }
;

trans_list:
'(' trans_set ')' trans_list_477 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); }
;

trans_set:
trans_range_list trans_set_478 { $$ = $1; P($$, $2); }
;

trans_range_list:
trans_item
| trans_item OSBS repeat_range ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| trans_item OSBMG repeat_range ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| trans_item OSBE repeat_range ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

trans_item:
covergroup_range_list
;

repeat_range:
covergroup_expression
| covergroup_expression ':' covergroup_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

cover_cross:
cover_cross_479 CROSS_ list_of_cross_items cover_cross_480 cross_body { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

list_of_cross_items:
cross_item ',' cross_item list_of_cross_items_481 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

cross_item:
cover_point_identifier
| variable_identifier
;

cross_body:
'{' cross_body_482 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| ';' { C($$); T($$, @1, zero, zero); }
;

cross_body_item:
function_declaration
| bins_selection_or_option ';' { $$ = $1; T($$, @2, zero, zero); }
;

bins_selection_or_option:
bins_selection_or_option_483 coverage_option { $$ = $1; P($$, $2); }
| bins_selection_or_option_484 bins_selection { $$ = $1; P($$, $2); }
;

bins_selection:
bins_keyword bin_identifier '=' select_expression bins_selection_485 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); }
;

select_expression:
select_condition
| '!' select_condition { C($$); T($$, @1, zero, zero); P($$, $2); }
| select_expression AMPAMP select_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| select_expression PIPEPIPE select_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| '(' select_expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| select_expression WITH_ '(' with_covergroup_expression ')' select_expression_486 { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| cross_identifier
| cross_set_expression select_expression_487 { $$ = $1; P($$, $2); }
;

select_condition:
BINSOF_ '(' bins_expression ')' select_condition_488 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

bins_expression:
variable_identifier
| cover_point_identifier bins_expression_489 { $$ = $1; P($$, $2); }
;

covergroup_range_list:
covergroup_value_range covergroup_range_list_490 { $$ = $1; P($$, $2); }
;

covergroup_value_range:
covergroup_expression
| '[' covergroup_expression ':' covergroup_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

with_covergroup_expression:
covergroup_expression
;

set_covergroup_expression:
covergroup_expression
;

integer_covergroup_expression:
covergroup_expression
;

cross_set_expression:
covergroup_expression
;

covergroup_expression:
expression
;

gate_instantiation:
cmos_switchtype gate_instantiation_491 cmos_switch_instance gate_instantiation_492 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| enable_gatetype gate_instantiation_493 gate_instantiation_494 enable_gate_instance gate_instantiation_495 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| mos_switchtype gate_instantiation_496 mos_switch_instance gate_instantiation_497 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| n_input_gatetype gate_instantiation_498 gate_instantiation_499 n_input_gate_instance gate_instantiation_500 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| n_output_gatetype gate_instantiation_501 gate_instantiation_502 n_output_gate_instance gate_instantiation_503 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| pass_en_switchtype gate_instantiation_504 pass_enable_switch_instance gate_instantiation_505 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| pass_switchtype pass_switch_instance gate_instantiation_506 ';' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| PULLDOWN_ gate_instantiation_507 pull_gate_instance gate_instantiation_508 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| PULLUP_ gate_instantiation_509 pull_gate_instance gate_instantiation_510 ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

cmos_switch_instance:
cmos_switch_instance_511 '(' output_terminal ',' input_terminal ',' ncontrol_terminal ',' pcontrol_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); T($$, @10, zero, zero); }
;

enable_gate_instance:
enable_gate_instance_512 '(' output_terminal ',' input_terminal ',' enable_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); }
;

mos_switch_instance:
mos_switch_instance_513 '(' output_terminal ',' input_terminal ',' enable_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); }
;

n_input_gate_instance:
n_input_gate_instance_514 '(' output_terminal ',' input_terminal n_input_gate_instance_515 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

n_output_gate_instance:
n_output_gate_instance_516 '(' output_terminal n_output_gate_instance_517 ',' input_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

pass_switch_instance:
pass_switch_instance_518 '(' inout_terminal ',' inout_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

pass_enable_switch_instance:
pass_enable_switch_instance_519 '(' inout_terminal ',' inout_terminal ',' enable_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); }
;

pull_gate_instance:
pull_gate_instance_520 '(' output_terminal ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
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

enable_terminal:
expression
;

inout_terminal:
net_lvalue
;

input_terminal:
expression
;

ncontrol_terminal:
expression
;

output_terminal:
net_lvalue
;

pcontrol_terminal:
expression
;

cmos_switchtype:
CMOS_ { C($$); T($$, @1, zero, zero); }
| RCMOS_ { C($$); T($$, @1, zero, zero); }
;

enable_gatetype:
BUFIF0_ { C($$); T($$, @1, zero, zero); }
| BUFIF1_ { C($$); T($$, @1, zero, zero); }
| NOTIF0_ { C($$); T($$, @1, zero, zero); }
| NOTIF1_ { C($$); T($$, @1, zero, zero); }
;

mos_switchtype:
NMOS_ { C($$); T($$, @1, zero, zero); }
| PMOS_ { C($$); T($$, @1, zero, zero); }
| RNMOS_ { C($$); T($$, @1, zero, zero); }
| RPMOS_ { C($$); T($$, @1, zero, zero); }
;

n_input_gatetype:
AND_ { C($$); T($$, @1, zero, zero); }
| NAND_ { C($$); T($$, @1, zero, zero); }
| OR_ { C($$); T($$, @1, zero, zero); }
| NOR_ { C($$); T($$, @1, zero, zero); }
| XOR_ { C($$); T($$, @1, zero, zero); }
| XNOR_ { C($$); T($$, @1, zero, zero); }
;

n_output_gatetype:
BUF_ { C($$); T($$, @1, zero, zero); }
| NOT_ { C($$); T($$, @1, zero, zero); }
;

pass_en_switchtype:
TRANIF0_ { C($$); T($$, @1, zero, zero); }
| TRANIF1_ { C($$); T($$, @1, zero, zero); }
| RTRANIF1_ { C($$); T($$, @1, zero, zero); }
| RTRANIF0_ { C($$); T($$, @1, zero, zero); }
;

pass_switchtype:
TRAN_ { C($$); T($$, @1, zero, zero); }
| RTRAN_ { C($$); T($$, @1, zero, zero); }
;

module_instantiation:
module_identifier module_instantiation_521 hierarchical_instance module_instantiation_522 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

parameter_value_assignment:
'#' '(' parameter_value_assignment_523 ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

list_of_parameter_assignments:
ordered_parameter_assignment list_of_parameter_assignments_524 { $$ = $1; P($$, $2); }
| named_parameter_assignment list_of_parameter_assignments_525 { $$ = $1; P($$, $2); }
;

ordered_parameter_assignment:
param_expression
;

named_parameter_assignment:
'.' parameter_identifier '(' named_parameter_assignment_526 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

hierarchical_instance:
name_of_instance '(' hierarchical_instance_527 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

name_of_instance:
instance_identifier name_of_instance_528 { $$ = $1; P($$, $2); }
;

list_of_port_connections:
ordered_port_connection list_of_port_connections_529 { $$ = $1; P($$, $2); }
| named_port_connection list_of_port_connections_530 { $$ = $1; P($$, $2); }
;

ordered_port_connection:
ordered_port_connection_531 ordered_port_connection_532 { $$ = $1; P($$, $2); }
;

named_port_connection:
named_port_connection_533 '.' port_identifier named_port_connection_534 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
| named_port_connection_536 DOTS { $$ = $1; T($$, @2, zero, zero); }
;

interface_instantiation:
interface_identifier interface_instantiation_537 hierarchical_instance interface_instantiation_538 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

program_instantiation:
program_identifier program_instantiation_539 hierarchical_instance program_instantiation_540 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

checker_instantiation:
ps_checker_identifier name_of_instance '(' checker_instantiation_541 ')' ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); }
;

list_of_checker_port_connections:
ordered_checker_port_connection list_of_checker_port_connections_542 { $$ = $1; P($$, $2); }
| named_checker_port_connection list_of_checker_port_connections_543 { $$ = $1; P($$, $2); }
;

ordered_checker_port_connection:
ordered_checker_port_connection_544 ordered_checker_port_connection_545 { $$ = $1; P($$, $2); }
;

named_checker_port_connection:
named_checker_port_connection_546 '.' formal_port_identifier named_checker_port_connection_547 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
| named_checker_port_connection_549 DOTS { $$ = $1; T($$, @2, zero, zero); }
;

generate_region:
GENERATE_ generate_region_550 ENDGENERATE_ { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

loop_generate_construct:
FOR_ '(' genvar_initialization ';' genvar_expression ';' genvar_iteration ')' generate_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
;

genvar_initialization:
genvar_initialization_551 genvar_identifier '=' constant_expression { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
;

genvar_iteration:
genvar_identifier assignment_operator genvar_expression { $$ = $1; P($$, $2); P($$, $3); }
| inc_or_dec_operator genvar_identifier { $$ = $1; P($$, $2); }
| genvar_identifier inc_or_dec_operator { $$ = $1; P($$, $2); }
;

conditional_generate_construct:
if_generate_construct
| case_generate_construct
;

if_generate_construct:
IF_ '(' constant_expression ')' generate_block if_generate_construct_552 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
;

case_generate_construct:
CASE_ '(' constant_expression ')' case_generate_item case_generate_construct_553 ENDCASE_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

case_generate_item:
constant_expression case_generate_item_554 ':' generate_block { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| DEFAULT_ case_generate_item_555 generate_block { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

generate_block:
generate_item
| generate_block_556 BEGIN_ generate_block_557 generate_block_558 END_ generate_block_559 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

generate_item:
module_or_generate_item
| interface_or_generate_item
| checker_or_generate_item
;

udp_nonansi_declaration:
udp_nonansi_declaration_560 PRIMITIVE_ udp_identifier '(' udp_port_list ')' ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); }
;

udp_ansi_declaration:
udp_ansi_declaration_561 PRIMITIVE_ udp_identifier '(' udp_declaration_port_list ')' ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); }
;

udp_declaration:
udp_nonansi_declaration udp_port_declaration udp_declaration_562 udp_body ENDPRIMITIVE_ udp_declaration_563 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| udp_ansi_declaration udp_body ENDPRIMITIVE_ udp_declaration_564 { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| EXTERN_ udp_nonansi_declaration { C($$); T($$, @1, zero, zero); P($$, $2); }
| EXTERN_ udp_ansi_declaration { C($$); T($$, @1, zero, zero); P($$, $2); }
| udp_declaration_565 PRIMITIVE_ udp_identifier '(' DOTS ')' ';' udp_declaration_566 udp_body ENDPRIMITIVE_ udp_declaration_567 { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); T($$, @5, zero, zero); T($$, @6, zero, zero); T($$, @7, zero, zero); P($$, $8); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
;

udp_port_list:
output_port_identifier ',' input_port_identifier udp_port_list_568 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

udp_declaration_port_list:
udp_output_declaration ',' udp_input_declaration udp_declaration_port_list_569 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

udp_port_declaration:
udp_output_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| udp_input_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| udp_reg_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
;

udp_output_declaration:
udp_output_declaration_570 OUTPUT_ port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| udp_output_declaration_571 OUTPUT_ REG_ port_identifier udp_output_declaration_572 { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); P($$, $5); }
;

udp_input_declaration:
udp_input_declaration_573 INPUT_ list_of_udp_port_identifiers { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_reg_declaration:
udp_reg_declaration_574 REG_ variable_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_body:
combinational_body
| sequential_body
;

combinational_body:
TABLE_ combinational_entry combinational_body_575 ENDTABLE_ { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

combinational_entry:
level_input_list ':' output_symbol ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

sequential_body:
sequential_body_576 TABLE_ sequential_entry sequential_body_577 ENDTABLE_ { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

udp_initial_statement:
INITIAL_ output_port_identifier '=' init_val ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
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

sequential_entry:
seq_input_list ':' current_state ':' next_state ';' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

seq_input_list:
level_input_list
| edge_input_list
;

level_input_list:
level_symbol level_input_list_578 { $$ = $1; P($$, $2); }
;

edge_input_list:
edge_input_list_579 edge_indicator edge_input_list_580 { $$ = $1; P($$, $2); P($$, $3); }
;

edge_indicator:
'(' level_symbol level_symbol ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| edge_symbol
;

current_state:
level_symbol
;

next_state:
output_symbol
| '-' { C($$); T($$, @1, zero, zero); }
;

output_symbol:
'0' { C($$); T($$, @1, zero, zero); }
| '1' { C($$); T($$, @1, zero, zero); }
| 'x' { C($$); T($$, @1, zero, zero); }
| 'X' { C($$); T($$, @1, zero, zero); }
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

udp_instantiation:
udp_identifier udp_instantiation_581 udp_instantiation_582 udp_instance udp_instantiation_583 ';' { $$ = $1; P($$, $2); P($$, $3); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

udp_instance:
udp_instance_584 '(' output_terminal ',' input_terminal udp_instance_585 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

continuous_assign:
ASSIGN_ continuous_assign_586 continuous_assign_587 list_of_net_assignments ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
| ASSIGN_ continuous_assign_588 list_of_variable_assignments ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

list_of_net_assignments:
net_assignment list_of_net_assignments_589 { $$ = $1; P($$, $2); }
;

list_of_variable_assignments:
variable_assignment list_of_variable_assignments_590 { $$ = $1; P($$, $2); }
;

net_alias:
ALIAS_ net_lvalue '=' net_lvalue net_alias_591 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

net_assignment:
net_lvalue '=' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

initial_construct:
INITIAL_ statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); }
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

final_construct:
FINAL_ function_statement { C($$); T($$, @1, zero, zero); P($$, $2); }
;

blocking_assignment:
variable_lvalue '=' delay_or_event_control expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
| nonrange_variable_lvalue '=' dynamic_array_new { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| blocking_assignment_592 hierarchical_variable_identifier select BANGE class_new { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| operator_assignment
;

operator_assignment:
variable_lvalue assignment_operator expression { $$ = $1; P($$, $2); P($$, $3); }
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

nonblocking_assignment:
variable_lvalue LE nonblocking_assignment_593 expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

procedural_continuous_assignment:
ASSIGN_ variable_assignment { C($$); T($$, @1, zero, zero); P($$, $2); }
| DEASSIGN_ variable_lvalue { C($$); T($$, @1, zero, zero); P($$, $2); }
| FORCE_ variable_assignment { C($$); T($$, @1, zero, zero); P($$, $2); }
| FORCE_ net_assignment { C($$); T($$, @1, zero, zero); P($$, $2); }
| RELEASE_ variable_lvalue { C($$); T($$, @1, zero, zero); P($$, $2); }
| RELEASE_ net_lvalue { C($$); T($$, @1, zero, zero); P($$, $2); }
;

variable_assignment:
variable_lvalue '=' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

action_block:
statement_or_null
| action_block_594 ELSE_ statement_or_null { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

seq_block:
BEGIN_ seq_block_595 seq_block_596 seq_block_597 END_ seq_block_598 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

par_block:
FORK_ par_block_599 par_block_600 par_block_601 join_keyword par_block_602 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

join_keyword:
JOIN_ { C($$); T($$, @1, zero, zero); }
| JOIN_ANY_ { C($$); T($$, @1, zero, zero); }
| JOIN_NONE_ { C($$); T($$, @1, zero, zero); }
;

statement_or_null:
statement
| statement_or_null_603 ';' { $$ = $1; T($$, @2, zero, zero); }
;

statement:
statement_604 statement_605 statement_item { $$ = $1; P($$, $2); P($$, $3); }
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

function_statement:
statement
;

function_statement_or_null:
function_statement
| function_statement_or_null_606 ';' { $$ = $1; T($$, @2, zero, zero); }
;

variable_identifier_list:
variable_identifier variable_identifier_list_607 { $$ = $1; P($$, $2); }
;

procedural_timing_control_statement:
procedural_timing_control statement_or_null { $$ = $1; P($$, $2); }
;

delay_or_event_control:
delay_control
| event_control
| REPEAT_ '(' expression ')' event_control { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

delay_control:
'#' delay_value { C($$); T($$, @1, zero, zero); P($$, $2); }
| '#' '(' mintypmax_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

event_control:
'@' hierarchical_event_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| '@' '(' event_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| ATS { C($$); T($$, @1, zero, zero); }
| '@' OPSCP { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
| '@' ps_or_hierarchical_sequence_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

event_expression:
event_expression_608 expression event_expression_609 { $$ = $1; P($$, $2); P($$, $3); }
| sequence_instance event_expression_610 { $$ = $1; P($$, $2); }
| event_expression OR_ event_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| event_expression ',' event_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| '(' event_expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

procedural_timing_control:
delay_control
| event_control
| cycle_delay
;

jump_statement:
RETURN_ jump_statement_611 ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| BREAK_ ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
| CONTINUE_ ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

wait_statement:
WAIT_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| WAIT_ FORK_ ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
| WAIT_ORDER_ '(' hierarchical_identifier wait_statement_612 ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

event_trigger:
MG hierarchical_event_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| MGG event_trigger_613 hierarchical_event_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

disable_statement:
DISABLE_ hierarchical_task_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| DISABLE_ hierarchical_block_identifier ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| DISABLE_ FORK_ ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

conditional_statement:
conditional_statement_614 IF_ '(' cond_predicate ')' statement_or_null conditional_statement_615 conditional_statement_616 { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); P($$, $8); }
;

unique_priority:
UNIQUE_ { C($$); T($$, @1, zero, zero); }
| UNIQUE0_ { C($$); T($$, @1, zero, zero); }
| PRIORITY_ { C($$); T($$, @1, zero, zero); }
;

cond_predicate:
expression_or_cond_pattern cond_predicate_617 { $$ = $1; P($$, $2); }
;

expression_or_cond_pattern:
expression
| cond_pattern
;

cond_pattern:
expression MATCHES_ pattern { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

case_statement:
case_statement_618 case_keyword '(' case_expression ')' case_item case_statement_619 ENDCASE_ { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); P($$, $7); T($$, @8, zero, zero); }
| case_statement_620 case_keyword '(' case_expression ')' MATCHES_ case_pattern_item case_statement_621 ENDCASE_ { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); }
| case_statement_622 CASE_ '(' case_expression ')' INSIDE_ case_inside_item case_statement_623 ENDCASE_ { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); }
;

case_keyword:
CASE_ { C($$); T($$, @1, zero, zero); }
| CASEZ_ { C($$); T($$, @1, zero, zero); }
| CASEX_ { C($$); T($$, @1, zero, zero); }
;

case_expression:
expression
;

case_item:
case_item_expression case_item_624 ':' statement_or_null { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| DEFAULT_ case_item_625 statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

case_pattern_item:
pattern case_pattern_item_626 ':' statement_or_null { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| DEFAULT_ case_pattern_item_627 statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

case_inside_item:
open_range_list ':' statement_or_null { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| DEFAULT_ case_inside_item_628 statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

case_item_expression:
expression
;

randcase_statement:
RANDCASE_ randcase_item randcase_statement_629 ENDCASE_ { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

randcase_item:
expression ':' statement_or_null { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

open_range_list:
open_value_range open_range_list_630 { $$ = $1; P($$, $2); }
;

open_value_range:
value_range
;

pattern:
'.' variable_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| DOTS { C($$); T($$, @1, zero, zero); }
| constant_expression
| TAGGED_ member_identifier pattern_631 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
| APOSOCB pattern pattern_632 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| APOSOCB member_identifier ':' pattern pattern_633 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
;

assignment_pattern:
APOSOCB expression assignment_pattern_634 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| APOSOCB structure_pattern_key ':' expression assignment_pattern_635 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| APOSOCB array_pattern_key ':' expression assignment_pattern_636 '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); }
| APOSOCB constant_expression '{' expression assignment_pattern_637 '}' '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); }
;

structure_pattern_key:
member_identifier
| assignment_pattern_key
;

array_pattern_key:
constant_expression
| assignment_pattern_key
;

assignment_pattern_key:
simple_type
| DEFAULT_ { C($$); T($$, @1, zero, zero); }
;

assignment_pattern_expression:
assignment_pattern_expression_638 assignment_pattern { $$ = $1; P($$, $2); }
;

assignment_pattern_expression_type:
ps_type_identifier
| ps_parameter_identifier
| integer_atom_type
| type_reference
;

constant_assignment_pattern_expression:
assignment_pattern_expression
;

assignment_pattern_net_lvalue:
APOSOCB net_lvalue assignment_pattern_net_lvalue_639 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

assignment_pattern_variable_lvalue:
APOSOCB variable_lvalue assignment_pattern_variable_lvalue_640 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

loop_statement:
FOREVER_ statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); }
| REPEAT_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| WHILE_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| FOR_ '(' loop_statement_641 ';' loop_statement_642 ';' loop_statement_643 ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); }
| DO_ statement_or_null WHILE_ '(' expression ')' ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); T($$, @7, zero, zero); }
| FOREACH_ '(' ps_or_hierarchical_array_identifier loop_statement_644 ')' statement { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

for_initialization:
list_of_variable_assignments
| for_variable_declaration for_initialization_645 { $$ = $1; P($$, $2); }
;

for_variable_declaration:
for_variable_declaration_646 data_type variable_identifier '=' expression for_variable_declaration_647 { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
;

for_step:
for_step_assignment for_step_648 { $$ = $1; P($$, $2); }
;

for_step_assignment:
operator_assignment
| inc_or_dec_expression
| function_subroutine_call
;

loop_variables:
loop_variables_649 loop_variables_650 { $$ = $1; P($$, $2); }
;

subroutine_call_statement:
subroutine_call ';' { $$ = $1; T($$, @2, zero, zero); }
| VOID_ '\'' '(' function_subroutine_call ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); }
;

assertion_item:
concurrent_assertion_item
| deferred_immediate_assertion_item
;

deferred_immediate_assertion_item:
deferred_immediate_assertion_item_652 deferred_immediate_assertion_statement { $$ = $1; P($$, $2); }
;

procedural_assertion_statement:
concurrent_assertion_statement
| immediate_assertion_statement
| checker_instantiation
;

immediate_assertion_statement:
simple_immediate_assertion_statement
| deferred_immediate_assertion_statement
;

simple_immediate_assertion_statement:
simple_immediate_assert_statement
| simple_immediate_assume_statement
| simple_immediate_cover_statement
;

simple_immediate_assert_statement:
ASSERT_ '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

simple_immediate_assume_statement:
ASSUME_ '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

simple_immediate_cover_statement:
COVER_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

deferred_immediate_assertion_statement:
deferred_immediate_assert_statement
| deferred_immediate_assume_statement
| deferred_immediate_cover_statement
;

deferred_immediate_assert_statement:
ASSERT_ N0 '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| ASSERT_ FINAL_ '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

deferred_immediate_assume_statement:
ASSUME_ N0 '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| ASSUME_ FINAL_ '(' expression ')' action_block { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

deferred_immediate_cover_statement:
COVER_ N0 '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
| COVER_ FINAL_ '(' expression ')' statement_or_null { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

clocking_declaration:
clocking_declaration_653 CLOCKING_ clocking_declaration_654 clocking_event ';' clocking_declaration_655 ENDCLOCKING_ clocking_declaration_656 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); P($$, $8); }
| GLOBAL_ CLOCKING_ clocking_declaration_657 clocking_event ';' ENDCLOCKING_ clocking_declaration_658 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); }
;

clocking_event:
'@' identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| '@' '(' event_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

clocking_item:
DEFAULT_ default_skew ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| clocking_direction list_of_clocking_decl_assign ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
| clocking_item_659 assertion_item_declaration { $$ = $1; P($$, $2); }
;

default_skew:
INPUT_ clocking_skew { C($$); T($$, @1, zero, zero); P($$, $2); }
| OUTPUT_ clocking_skew { C($$); T($$, @1, zero, zero); P($$, $2); }
| INPUT_ clocking_skew OUTPUT_ clocking_skew { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); }
;

clocking_direction:
INPUT_ clocking_direction_660 { C($$); T($$, @1, zero, zero); P($$, $2); }
| OUTPUT_ clocking_direction_661 { C($$); T($$, @1, zero, zero); P($$, $2); }
| INPUT_ clocking_direction_662 OUTPUT_ clocking_direction_663 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); }
| INOUT_ { C($$); T($$, @1, zero, zero); }
;

list_of_clocking_decl_assign:
clocking_decl_assign list_of_clocking_decl_assign_664 { $$ = $1; P($$, $2); }
;

clocking_decl_assign:
signal_identifier clocking_decl_assign_665 { $$ = $1; P($$, $2); }
;

clocking_skew:
edge_identifier clocking_skew_666 { $$ = $1; P($$, $2); }
| delay_control
;

clocking_drive:
clockvar_expression LE clocking_drive_667 expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

cycle_delay:
NN integral_number { C($$); T($$, @1, zero, zero); P($$, $2); }
| NN identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
| NN '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

clockvar:
hierarchical_identifier
;

clockvar_expression:
clockvar select { $$ = $1; P($$, $2); }
;

randsequence_statement:
RANDSEQUENCE_ '(' randsequence_statement_668 ')' production randsequence_statement_669 ENDSEQUENCE_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

production:
production_670 production_identifier production_671 ':' rs_rule production_672 ';' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

rs_rule:
rs_production_list rs_rule_673 { $$ = $1; P($$, $2); }
;

rs_production_list:
rs_prod rs_production_list_675 { $$ = $1; P($$, $2); }
| RAND_ JOIN_ rs_production_list_676 production_item production_item rs_production_list_677 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); P($$, $6); }
;

weight_specification:
integral_number
| ps_identifier '(' expression ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

rs_code_block:
'{' rs_code_block_678 rs_code_block_679 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

rs_prod:
production_item
| rs_code_block
| rs_if_else
| rs_repeat
| rs_case
;

production_item:
production_identifier production_item_680 { $$ = $1; P($$, $2); }
;

rs_if_else:
IF_ '(' expression ')' production_item rs_if_else_681 { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); }
;

rs_repeat:
REPEAT_ '(' expression ')' production_item { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

rs_case:
CASE_ '(' case_expression ')' rs_case_item rs_case_682 ENDCASE_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); }
;

rs_case_item:
case_item_expression rs_case_item_683 ':' production_item ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| DEFAULT_ rs_case_item_684 production_item ';' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

specify_block:
SPECIFY_ specify_block_685 ENDSPECIFY_ { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

specify_item:
specparam_declaration
| pulsestyle_declaration
| showcancelled_declaration
| path_declaration
| system_timing_check
;

pulsestyle_declaration:
PULSESTYLE_ONEVENT_ list_of_path_outputs ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| PULSESTYLE_ONDETECT_ list_of_path_outputs ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

showcancelled_declaration:
SHOWCANCELLED_ list_of_path_outputs ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| NOSHOWCANCELLED_ list_of_path_outputs ';' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

path_declaration:
simple_path_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| edge_sensitive_path_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
| state_dependent_path_declaration ';' { $$ = $1; T($$, @2, zero, zero); }
;

simple_path_declaration:
parallel_path_description '=' path_delay_value { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| full_path_description '=' path_delay_value { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

parallel_path_description:
'(' specify_input_terminal_descriptor parallel_path_description_686 EG specify_output_terminal_descriptor ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

full_path_description:
'(' list_of_path_inputs full_path_description_687 SG list_of_path_outputs ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); }
;

list_of_path_inputs:
specify_input_terminal_descriptor list_of_path_inputs_688 { $$ = $1; P($$, $2); }
;

list_of_path_outputs:
specify_output_terminal_descriptor list_of_path_outputs_689 { $$ = $1; P($$, $2); }
;

specify_input_terminal_descriptor:
input_identifier specify_input_terminal_descriptor_690 { $$ = $1; P($$, $2); }
;

specify_output_terminal_descriptor:
output_identifier specify_output_terminal_descriptor_691 { $$ = $1; P($$, $2); }
;

input_identifier:
input_port_identifier
| inout_port_identifier
| interface_identifier '.' port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

output_identifier:
output_port_identifier
| inout_port_identifier
| interface_identifier '.' port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

path_delay_value:
list_of_path_delay_expressions
| '(' list_of_path_delay_expressions ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

list_of_path_delay_expressions:
t_path_delay_expression
| trise_path_delay_expression ',' tfall_path_delay_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| trise_path_delay_expression ',' tfall_path_delay_expression ',' tz_path_delay_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| t01_path_delay_expression ',' t10_path_delay_expression ',' t0z_path_delay_expression ',' tz1_path_delay_expression ',' t1z_path_delay_expression ',' tz0_path_delay_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); T($$, @10, zero, zero); P($$, $11); }
| t01_path_delay_expression ',' t10_path_delay_expression ',' t0z_path_delay_expression ',' tz1_path_delay_expression ',' t1z_path_delay_expression ',' tz0_path_delay_expression ',' t0x_path_delay_expression ',' tx1_path_delay_expression ',' t1x_path_delay_expression ',' tx0_path_delay_expression ',' txz_path_delay_expression ',' tzx_path_delay_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); T($$, @10, zero, zero); P($$, $11); T($$, @12, zero, zero); P($$, $13); T($$, @14, zero, zero); P($$, $15); T($$, @16, zero, zero); P($$, $17); T($$, @18, zero, zero); P($$, $19); T($$, @20, zero, zero); P($$, $21); T($$, @22, zero, zero); P($$, $23); }
;

t_path_delay_expression:
path_delay_expression
;

trise_path_delay_expression:
path_delay_expression
;

tfall_path_delay_expression:
path_delay_expression
;

tz_path_delay_expression:
path_delay_expression
;

t01_path_delay_expression:
path_delay_expression /* ignore */
;

t10_path_delay_expression:
path_delay_expression
;

t0z_path_delay_expression:
path_delay_expression
;

tz1_path_delay_expression:
path_delay_expression
;

t1z_path_delay_expression:
path_delay_expression
;

tz0_path_delay_expression:
path_delay_expression
;

t0x_path_delay_expression:
path_delay_expression
;

tx1_path_delay_expression:
path_delay_expression
;

t1x_path_delay_expression:
path_delay_expression
;

tx0_path_delay_expression:
path_delay_expression
;

txz_path_delay_expression:
path_delay_expression
;

tzx_path_delay_expression:
path_delay_expression
;

path_delay_expression:
constant_mintypmax_expression
;

edge_sensitive_path_declaration:
parallel_edge_sensitive_path_description '=' path_delay_value { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| full_edge_sensitive_path_description '=' path_delay_value { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

parallel_edge_sensitive_path_description:
'(' parallel_edge_sensitive_path_description_692 specify_input_terminal_descriptor parallel_edge_sensitive_path_description_693 EG '(' specify_output_terminal_descriptor parallel_edge_sensitive_path_description_694 ':' data_source_expression ')' ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

full_edge_sensitive_path_description:
'(' full_edge_sensitive_path_description_695 list_of_path_inputs full_edge_sensitive_path_description_696 SG '(' list_of_path_outputs full_edge_sensitive_path_description_697 ':' data_source_expression ')' ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

data_source_expression:
expression
;

edge_identifier:
POSEDGE_ { C($$); T($$, @1, zero, zero); }
| NEGEDGE_ { C($$); T($$, @1, zero, zero); }
| EDGE_ { C($$); T($$, @1, zero, zero); }
;

state_dependent_path_declaration:
IF_ '(' module_path_expression ')' simple_path_declaration { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| IF_ '(' module_path_expression ')' edge_sensitive_path_declaration { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
| IFNONE_ simple_path_declaration { C($$); T($$, @1, zero, zero); P($$, $2); }
;

polarity_operator:
'+' { C($$); T($$, @1, zero, zero); }
| '-' { C($$); T($$, @1, zero, zero); }
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

setup_timing_check:
Dsetup '(' data_event ',' reference_event ',' timing_check_limit setup_timing_check_698 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

hold_timing_check:
Dhold '(' reference_event ',' data_event ',' timing_check_limit hold_timing_check_700 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

setuphold_timing_check:
Dsetuphold '(' reference_event ',' data_event ',' timing_check_limit ',' timing_check_limit setuphold_timing_check_702 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

recovery_timing_check:
Drecovery '(' reference_event ',' data_event ',' timing_check_limit recovery_timing_check_712 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

removal_timing_check:
Dremoval '(' reference_event ',' data_event ',' timing_check_limit removal_timing_check_714 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

recrem_timing_check:
Drecrem '(' reference_event ',' data_event ',' timing_check_limit ',' timing_check_limit recrem_timing_check_716 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

skew_timing_check:
Dskew '(' reference_event ',' data_event ',' timing_check_limit skew_timing_check_726 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

timeskew_timing_check:
Dtimeskew '(' reference_event ',' data_event ',' timing_check_limit timeskew_timing_check_728 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

fullskew_timing_check:
Dfullskew '(' reference_event ',' data_event ',' timing_check_limit ',' timing_check_limit fullskew_timing_check_734 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

period_timing_check:
Dperiod '(' controlled_reference_event ',' timing_check_limit period_timing_check_740 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); P($$, $6); T($$, @7, zero, zero); T($$, @8, zero, zero); }
;

width_timing_check:
Dwidth '(' controlled_reference_event ',' timing_check_limit ',' threshold width_timing_check_742 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); P($$, $8); T($$, @9, zero, zero); T($$, @10, zero, zero); }
;

nochange_timing_check:
Dnochange '(' reference_event ',' data_event ',' start_edge_offset ',' end_edge_offset nochange_timing_check_744 ')' ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); T($$, @8, zero, zero); P($$, $9); P($$, $10); T($$, @11, zero, zero); T($$, @12, zero, zero); }
;

timecheck_condition:
mintypmax_expression
;

controlled_reference_event:
controlled_timing_check_event
;

data_event:
timing_check_event
;

delayed_data:
terminal_identifier
| terminal_identifier '[' constant_mintypmax_expression ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

delayed_reference:
terminal_identifier
| terminal_identifier '[' constant_mintypmax_expression ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

end_edge_offset:
mintypmax_expression
;

event_based_flag:
constant_expression
;

notifier:
variable_identifier
;

reference_event:
timing_check_event
;

remain_active_flag:
constant_mintypmax_expression
;

timestamp_condition:
mintypmax_expression
;

start_edge_offset:
mintypmax_expression
;

threshold:
constant_expression
;

timing_check_limit:
expression
;

timing_check_event:
timing_check_event_746 specify_terminal_descriptor timing_check_event_747 { $$ = $1; P($$, $2); P($$, $3); }
;

controlled_timing_check_event:
timing_check_event_control specify_terminal_descriptor controlled_timing_check_event_748 { $$ = $1; P($$, $2); P($$, $3); }
;

timing_check_event_control:
POSEDGE_ { C($$); T($$, @1, zero, zero); }
| NEGEDGE_ { C($$); T($$, @1, zero, zero); }
| EDGE_ { C($$); T($$, @1, zero, zero); }
| edge_control_specifier
;

specify_terminal_descriptor:
specify_input_terminal_descriptor
| specify_output_terminal_descriptor
;

edge_control_specifier:
EDGE_ '[' edge_descriptor edge_control_specifier_749 ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

edge_descriptor:
_01 { C($$); T($$, @1, zero, zero); }
| _10 { C($$); T($$, @1, zero, zero); }
| z_or_x zero_or_one { $$ = $1; P($$, $2); }
| zero_or_one z_or_x { $$ = $1; P($$, $2); }
;

zero_or_one:
'0' { C($$); T($$, @1, zero, zero); }
| '1' { C($$); T($$, @1, zero, zero); }
;

z_or_x:
'x' { C($$); T($$, @1, zero, zero); }
| 'X' { C($$); T($$, @1, zero, zero); }
| 'z' { C($$); T($$, @1, zero, zero); }
| 'Z' { C($$); T($$, @1, zero, zero); }
;

timing_check_condition:
scalar_timing_check_condition
| '(' scalar_timing_check_condition ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

scalar_timing_check_condition:
expression
| '~' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
| expression EE scalar_constant { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression EEE scalar_constant { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression BANGE scalar_constant { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression BANGEE scalar_constant { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
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

concatenation:
'{' expression concatenation_750 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

constant_concatenation:
'{' constant_expression constant_concatenation_751 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

constant_multiple_concatenation:
'{' constant_expression constant_concatenation '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

module_path_concatenation:
'{' module_path_expression module_path_concatenation_752 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

module_path_multiple_concatenation:
'{' constant_expression module_path_concatenation '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

multiple_concatenation:
'{' expression concatenation '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

streaming_concatenation:
'{' stream_operator streaming_concatenation_753 stream_concatenation '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

stream_operator:
GG { C($$); T($$, @1, zero, zero); }
| LL { C($$); T($$, @1, zero, zero); }
;

slice_size:
simple_type
| constant_expression
;

stream_concatenation:
'{' stream_expression stream_concatenation_754 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

stream_expression:
expression stream_expression_755 { $$ = $1; P($$, $2); }
;

array_range_expression:
expression
| expression ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression PLUSC expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression MC expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

empty_queue:
'{' '}' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

constant_function_call:
function_subroutine_call
;

tf_call:
ps_or_hierarchical_tf_identifier tf_call_756 tf_call_757 { $$ = $1; P($$, $2); P($$, $3); }
;

system_tf_call:
system_tf_identifier system_tf_call_758 { $$ = $1; P($$, $2); }
| system_tf_identifier '(' data_type system_tf_call_759 ')' { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); }
;

subroutine_call:
tf_call
| system_tf_call
| method_call
| subroutine_call_760 randomize_call { $$ = $1; P($$, $2); }
;

function_subroutine_call:
subroutine_call
;

list_of_arguments:
list_of_arguments_761 list_of_arguments_762 list_of_arguments_764 { $$ = $1; P($$, $2); P($$, $3); }
| '.' identifier '(' list_of_arguments_766 ')' list_of_arguments_767 { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

method_call:
method_call_root '.' method_call_body { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

method_call_body:
method_identifier method_call_body_769 method_call_body_770 { $$ = $1; P($$, $2); P($$, $3); }
| built_in_method_call
;

built_in_method_call:
array_manipulation_call
| randomize_call
;

array_manipulation_call:
array_method_name array_manipulation_call_771 array_manipulation_call_772 array_manipulation_call_773 { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
;

randomize_call:
RANDOMIZE_ randomize_call_774 randomize_call_775 randomize_call_777 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); P($$, $4); }
;

method_call_root:
primary
| implicit_class_handle
;

array_method_name:
method_identifier
| UNIQUE_ { C($$); T($$, @1, zero, zero); }
| AND_ { C($$); T($$, @1, zero, zero); }
| OR_ { C($$); T($$, @1, zero, zero); }
| XOR_ { C($$); T($$, @1, zero, zero); }
;

inc_or_dec_expression:
inc_or_dec_operator inc_or_dec_expression_780 variable_lvalue { $$ = $1; P($$, $2); P($$, $3); }
| variable_lvalue inc_or_dec_expression_781 inc_or_dec_operator { $$ = $1; P($$, $2); P($$, $3); }
;

conditional_expression:
cond_predicate '?' conditional_expression_782 expression ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

constant_expression:
constant_primary
| unary_operator constant_expression_783 constant_primary { $$ = $1; P($$, $2); P($$, $3); }
| constant_expression binary_operator constant_expression_784 constant_expression { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| constant_expression '?' constant_expression_785 constant_expression ':' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

constant_mintypmax_expression:
constant_expression
| constant_expression ':' constant_expression ':' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

constant_param_expression:
constant_mintypmax_expression
| data_type
| '$' { C($$); T($$, @1, zero, zero); }
;

param_expression:
mintypmax_expression
| data_type
| '$' { C($$); T($$, @1, zero, zero); }
;

constant_range_expression:
constant_expression
| constant_part_select_range
;

constant_part_select_range:
constant_range
| constant_indexed_range
;

constant_range:
constant_expression ':' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

constant_indexed_range:
constant_expression PLUSC constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| constant_expression MC constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

expression:
primary
| unary_operator expression_786 primary { $$ = $1; P($$, $2); P($$, $3); }
| inc_or_dec_expression
| '(' operator_assignment ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| expression binary_operator expression_787 expression { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| conditional_expression
| inside_expression
| tagged_union_expression
;

tagged_union_expression:
TAGGED_ member_identifier tagged_union_expression_788 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

inside_expression:
expression INSIDE_ '{' open_range_list '}' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

value_range:
expression
| '[' expression ':' expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

mintypmax_expression:
expression
| expression ':' expression ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

module_path_conditional_expression:
module_path_expression '?' module_path_conditional_expression_789 module_path_expression ':' module_path_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); T($$, @5, zero, zero); P($$, $6); }
;

module_path_expression:
module_path_primary
| unary_module_path_operator module_path_expression_790 module_path_primary { $$ = $1; P($$, $2); P($$, $3); }
| module_path_expression binary_module_path_operator module_path_expression_791 module_path_expression { $$ = $1; P($$, $2); P($$, $3); P($$, $4); }
| module_path_conditional_expression
;

module_path_mintypmax_expression:
module_path_expression
| module_path_expression ':' module_path_expression ':' module_path_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

part_select_range:
constant_range
| indexed_range
;

indexed_range:
expression PLUSC constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
| expression MC constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

genvar_expression:
constant_expression
;

constant_primary:
primary_literal
| ps_parameter_identifier constant_select { $$ = $1; P($$, $2); }
| specparam_identifier constant_primary_792 { $$ = $1; P($$, $2); }
| genvar_identifier
| formal_port_identifier constant_select { $$ = $1; P($$, $2); }
| constant_primary_793 enum_identifier { $$ = $1; P($$, $2); }
| constant_concatenation constant_primary_794 { $$ = $1; P($$, $2); }
| constant_multiple_concatenation constant_primary_795 { $$ = $1; P($$, $2); }
| constant_function_call
| constant_let_expression
| '(' constant_mintypmax_expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| constant_cast
| constant_assignment_pattern_expression
| type_reference
;

module_path_primary:
number
| identifier
| module_path_concatenation
| module_path_multiple_concatenation
| function_subroutine_call /* ignore */
| '(' module_path_mintypmax_expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

primary:
primary_literal
| primary_796 hierarchical_identifier select { $$ = $1; P($$, $2); P($$, $3); }
| empty_queue
| concatenation primary_797 { $$ = $1; P($$, $2); }
| multiple_concatenation primary_798 { $$ = $1; P($$, $2); }
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

class_qualifier:
class_qualifier_799 class_qualifier_800 { $$ = $1; P($$, $2); }
;

range_expression:
expression
| part_select_range
;

primary_literal:
number
| time_literal
| unbased_unsized_literal
| string_literal
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

implicit_class_handle:
THIS_ /* { C($$); T($$, @1, zero, zero); } -- ignore */
| SUPER_ { C($$); T($$, @1, zero, zero); }
| THIS_ '.' SUPER_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

bit_select:
bit_select_801
;

select:
select_802 bit_select select_804 { $$ = $1; P($$, $2); P($$, $3); }
;

nonrange_select:
nonrange_select_805 bit_select { $$ = $1; P($$, $2); }
;

constant_bit_select:
constant_bit_select_807
;

constant_select:
constant_select_808 constant_bit_select constant_select_810 { $$ = $1; P($$, $2); P($$, $3); }
;

constant_cast:
casting_type '\'' '(' constant_expression ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

constant_let_expression:
let_expression
;

cast:
casting_type '\'' '(' expression ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

net_lvalue:
ps_or_hierarchical_net_identifier constant_select { $$ = $1; P($$, $2); }
| '{' net_lvalue net_lvalue_811 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| net_lvalue_812 assignment_pattern_net_lvalue { $$ = $1; P($$, $2); }
;

variable_lvalue:
variable_lvalue_813 hierarchical_variable_identifier select { $$ = $1; P($$, $2); P($$, $3); }
| '{' variable_lvalue variable_lvalue_814 '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
| variable_lvalue_815 assignment_pattern_variable_lvalue { $$ = $1; P($$, $2); }
| streaming_concatenation
;

nonrange_variable_lvalue:
nonrange_variable_lvalue_816 hierarchical_variable_identifier nonrange_select { $$ = $1; P($$, $2); P($$, $3); }
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

inc_or_dec_operator:
PLUSPLUS { C($$); T($$, @1, zero, zero); }
| MM { C($$); T($$, @1, zero, zero); }
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

number:
integral_number
| real_number
;

attribute_instance:
OPS attr_spec attribute_instance_817 SCP { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

attr_spec:
attr_name attr_spec_818 { $$ = $1; P($$, $2); }
;

attr_name:
identifier
;

block_identifier:
identifier
;

bin_identifier:
identifier
;

cell_identifier:
identifier
;

checker_identifier:
identifier
;

class_identifier:
identifier
;

class_variable_identifier:
variable_identifier
;

clocking_identifier:
identifier
;

config_identifier:
identifier
;

const_identifier:
identifier
;

constraint_identifier:
identifier
;

covergroup_identifier:
identifier
;

cover_point_identifier:
identifier
;

cross_identifier:
identifier
;

dynamic_array_variable_identifier:
variable_identifier
;

enum_identifier:
identifier
;

formal_port_identifier:
identifier
;

function_identifier:
identifier
;

generate_block_identifier:
identifier
;

genvar_identifier:
identifier
;

hierarchical_array_identifier:
hierarchical_identifier
;

hierarchical_block_identifier:
hierarchical_identifier
;

hierarchical_event_identifier:
hierarchical_identifier
;

hierarchical_identifier:
hierarchical_identifier_819 hierarchical_identifier_820 identifier { $$ = $1; P($$, $2); P($$, $3); }
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

identifier:
simple_identifier
| escaped_identifier
;

index_variable_identifier:
identifier
;

interface_identifier:
identifier
;

interface_instance_identifier:
identifier
;

inout_port_identifier:
identifier
;

input_port_identifier:
identifier
;

instance_identifier:
identifier
;

library_identifier:
identifier
;

member_identifier:
identifier
;

method_identifier:
identifier
;

modport_identifier:
identifier
;

module_identifier:
identifier
;

net_identifier:
identifier
;

net_type_identifier:
identifier
;

output_port_identifier:
identifier
;

package_identifier:
identifier
;

package_scope:
package_identifier CC { $$ = $1; T($$, @2, zero, zero); }
| Dunit CC { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

parameter_identifier:
identifier
;

port_identifier:
identifier
;

production_identifier:
identifier
;

program_identifier:
identifier
;

property_identifier:
identifier
;

ps_class_identifier:
ps_class_identifier_821 class_identifier { $$ = $1; P($$, $2); }
;

ps_covergroup_identifier:
ps_covergroup_identifier_822 covergroup_identifier { $$ = $1; P($$, $2); }
;

ps_checker_identifier:
ps_checker_identifier_823 checker_identifier { $$ = $1; P($$, $2); }
;

ps_identifier:
ps_identifier_824 identifier { $$ = $1; P($$, $2); }
;

ps_or_hierarchical_array_identifier:
ps_or_hierarchical_array_identifier_825 hierarchical_array_identifier { $$ = $1; P($$, $2); }
;

ps_or_hierarchical_net_identifier:
ps_or_hierarchical_net_identifier_826 net_identifier { $$ = $1; P($$, $2); }
| hierarchical_net_identifier
;

ps_or_hierarchical_property_identifier:
ps_or_hierarchical_property_identifier_827 property_identifier { $$ = $1; P($$, $2); }
| hierarchical_property_identifier
;

ps_or_hierarchical_sequence_identifier:
ps_or_hierarchical_sequence_identifier_828 sequence_identifier { $$ = $1; P($$, $2); }
| hierarchical_sequence_identifier
;

ps_or_hierarchical_tf_identifier:
ps_or_hierarchical_tf_identifier_829 tf_identifier { $$ = $1; P($$, $2); }
| hierarchical_tf_identifier
;

ps_parameter_identifier:
ps_parameter_identifier_830 parameter_identifier { $$ = $1; P($$, $2); }
| ps_parameter_identifier_831 parameter_identifier { $$ = $1; P($$, $2); }
;

ps_type_identifier:
ps_type_identifier_833 type_identifier { $$ = $1; P($$, $2); }
;

sequence_identifier:
identifier
;

signal_identifier:
identifier
;

specparam_identifier:
identifier
;

task_identifier:
identifier
;

tf_identifier:
identifier
;

terminal_identifier:
identifier
;

topmodule_identifier:
identifier
;

type_identifier:
identifier
;

udp_identifier:
identifier
;

variable_identifier:
identifier
;

library_text_0:
%empty { C($$); }
| library_text_0 library_description { $$ = $1; P($$, $2); }
;

library_declaration_1:
%empty { C($$); }
| library_declaration_1 ',' file_path_spec { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

library_declaration_2_2:
%empty { C($$); }
| library_declaration_2_2 ',' file_path_spec { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

library_declaration_2:
%empty { C($$); }
| Mincdir file_path_spec library_declaration_2_2 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

source_text_4:
%empty { C($$); }
| timeunits_declaration
;

source_text_5:
%empty { C($$); }
| source_text_5 description { $$ = $1; P($$, $2); }
;

description_6:
%empty { C($$); }
| description_6 attribute_instance { $$ = $1; P($$, $2); }
;

description_7:
%empty /* { C($$); } -- ignore */
| description_7 attribute_instance { $$ = $1; P($$, $2); }
;

module_nonansi_header_8:
%empty { C($$); }
| module_nonansi_header_8 attribute_instance { $$ = $1; P($$, $2); }
;

module_nonansi_header_9:
%empty { C($$); }
| lifetime
;

module_nonansi_header_10:
%empty { C($$); }
| module_nonansi_header_10 package_import_declaration { $$ = $1; P($$, $2); }
;

module_nonansi_header_11:
%empty { C($$); }
| parameter_port_list
;

module_ansi_header_12:
%empty /* { C($$); } -- ignore */
| module_ansi_header_12 attribute_instance { $$ = $1; P($$, $2); }
;

module_ansi_header_13:
%empty { C($$); }
| lifetime
;

module_ansi_header_14:
%empty { C($$); }
| module_ansi_header_14 package_import_declaration { $$ = $1; P($$, $2); }
;

module_ansi_header_15:
%empty { C($$); }
| parameter_port_list
;

module_ansi_header_16:
%empty { C($$); }
| list_of_port_declarations
;

module_declaration_17:
%empty { C($$); }
| timeunits_declaration
;

module_declaration_18:
%empty { C($$); }
| module_declaration_18 module_item { $$ = $1; P($$, $2); }
;

module_declaration_19:
%empty { C($$); }
| ':' module_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

module_declaration_20:
%empty { C($$); }
| timeunits_declaration
;

module_declaration_21:
%empty { C($$); }
| module_declaration_21 non_port_module_item { $$ = $1; P($$, $2); }
;

module_declaration_22:
%empty { C($$); }
| ':' module_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

module_declaration_23:
%empty /* { C($$); } -- ignore */
| module_declaration_23 attribute_instance { $$ = $1; P($$, $2); }
;

module_declaration_24:
%empty { C($$); }
| lifetime
;

module_declaration_25:
%empty { C($$); }
| timeunits_declaration
;

module_declaration_26:
%empty { C($$); }
| module_declaration_26 module_item { $$ = $1; P($$, $2); }
;

module_declaration_27:
%empty { C($$); }
| ':' module_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

interface_declaration_28:
%empty { C($$); }
| timeunits_declaration
;

interface_declaration_29:
%empty { C($$); }
| interface_declaration_29 interface_item { $$ = $1; P($$, $2); }
;

interface_declaration_30:
%empty { C($$); }
| ':' interface_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

interface_declaration_31:
%empty { C($$); }
| timeunits_declaration
;

interface_declaration_32:
%empty { C($$); }
| interface_declaration_32 non_port_interface_item { $$ = $1; P($$, $2); }
;

interface_declaration_33:
%empty { C($$); }
| ':' interface_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

interface_declaration_34:
%empty { C($$); }
| interface_declaration_34 attribute_instance { $$ = $1; P($$, $2); }
;

interface_declaration_35:
%empty { C($$); }
| timeunits_declaration
;

interface_declaration_36:
%empty { C($$); }
| interface_declaration_36 interface_item { $$ = $1; P($$, $2); }
;

interface_declaration_37:
%empty { C($$); }
| ':' interface_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

interface_nonansi_header_38:
%empty { C($$); }
| interface_nonansi_header_38 attribute_instance { $$ = $1; P($$, $2); }
;

interface_nonansi_header_39:
%empty { C($$); }
| lifetime
;

interface_nonansi_header_40:
%empty { C($$); }
| interface_nonansi_header_40 package_import_declaration { $$ = $1; P($$, $2); }
;

interface_nonansi_header_41:
%empty { C($$); }
| parameter_port_list
;

interface_ansi_header_42:
%empty /* { C($$); } -- ignore */
| interface_ansi_header_42 attribute_instance { $$ = $1; P($$, $2); }
;

interface_ansi_header_43:
%empty { C($$); }
| lifetime
;

interface_ansi_header_44:
%empty { C($$); }
| interface_ansi_header_44 package_import_declaration { $$ = $1; P($$, $2); }
;

interface_ansi_header_45:
%empty { C($$); }
| parameter_port_list
;

interface_ansi_header_46:
%empty { C($$); }
| list_of_port_declarations
;

program_declaration_47:
%empty { C($$); }
| timeunits_declaration
;

program_declaration_48:
%empty { C($$); }
| program_declaration_48 program_item { $$ = $1; P($$, $2); }
;

program_declaration_49:
%empty { C($$); }
| ':' program_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

program_declaration_50:
%empty { C($$); }
| timeunits_declaration
;

program_declaration_51:
%empty { C($$); }
| program_declaration_51 non_port_program_item { $$ = $1; P($$, $2); }
;

program_declaration_52:
%empty { C($$); }
| ':' program_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

program_declaration_53:
%empty { C($$); }
| program_declaration_53 attribute_instance { $$ = $1; P($$, $2); }
;

program_declaration_54:
%empty { C($$); }
| timeunits_declaration
;

program_declaration_55:
%empty { C($$); }
| program_declaration_55 program_item { $$ = $1; P($$, $2); }
;

program_declaration_56:
%empty { C($$); }
| ':' program_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

program_nonansi_header_57:
%empty { C($$); }
| program_nonansi_header_57 attribute_instance { $$ = $1; P($$, $2); }
;

program_nonansi_header_58:
%empty { C($$); }
| lifetime
;

program_nonansi_header_59:
%empty { C($$); }
| program_nonansi_header_59 package_import_declaration { $$ = $1; P($$, $2); }
;

program_nonansi_header_60:
%empty { C($$); }
| parameter_port_list
;

program_ansi_header_61:
%empty /* { C($$); } -- ignore */
| program_ansi_header_61 attribute_instance { $$ = $1; P($$, $2); }
;

program_ansi_header_62:
%empty { C($$); }
| lifetime
;

program_ansi_header_63:
%empty { C($$); }
| program_ansi_header_63 package_import_declaration { $$ = $1; P($$, $2); }
;

program_ansi_header_64:
%empty { C($$); }
| parameter_port_list
;

program_ansi_header_65:
%empty { C($$); }
| list_of_port_declarations
;

checker_declaration_66_66:
%empty { C($$); }
| checker_port_list
;

checker_declaration_66:
%empty { C($$); }
| '(' checker_declaration_66_66 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

checker_declaration_68_68:
%empty { C($$); }
| checker_declaration_68_68 attribute_instance { $$ = $1; P($$, $2); }
;

checker_declaration_68:
%empty { C($$); }
| checker_declaration_68 checker_declaration_68_68 checker_or_generate_item { $$ = $1; P($$, $2); P($$, $3); }
;

checker_declaration_70:
%empty { C($$); }
| ':' checker_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

class_declaration_71:
%empty { C($$); }
| VIRTUAL_ { C($$); T($$, @1, zero, zero); }
;

class_declaration_72:
%empty { C($$); }
| lifetime
;

class_declaration_73:
%empty { C($$); }
| parameter_port_list
;

class_declaration_74_74:
%empty { C($$); }
| '(' list_of_arguments ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

class_declaration_74:
%empty { C($$); }
| EXTENDS_ class_type class_declaration_74_74 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

class_declaration_76_76:
%empty { C($$); }
| class_declaration_76_76 ',' interface_class_type { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

class_declaration_76:
%empty { C($$); }
| IMPLEMENTS_ interface_class_type class_declaration_76_76 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

class_declaration_78:
%empty { C($$); }
| class_declaration_78 class_item { $$ = $1; P($$, $2); }
;

class_declaration_79:
%empty { C($$); }
| ':' class_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

interface_class_type_80:
%empty { C($$); }
| parameter_value_assignment
;

interface_class_declaration_81:
%empty { C($$); }
| parameter_port_list
;

interface_class_declaration_82_82:
%empty { C($$); }
| interface_class_declaration_82_82 ',' interface_class_type { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

interface_class_declaration_82:
%empty { C($$); }
| EXTENDS_ interface_class_type interface_class_declaration_82_82 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

interface_class_declaration_84:
%empty { C($$); }
| interface_class_declaration_84 interface_class_item { $$ = $1; P($$, $2); }
;

interface_class_declaration_85:
%empty { C($$); }
| ':' class_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

interface_class_item_86:
%empty { C($$); }
| interface_class_item_86 attribute_instance { $$ = $1; P($$, $2); }
;

package_declaration_87:
%empty { C($$); }
| package_declaration_87 attribute_instance { $$ = $1; P($$, $2); }
;

package_declaration_88:
%empty { C($$); }
| lifetime
;

package_declaration_89:
%empty { C($$); }
| timeunits_declaration
;

package_declaration_90_90:
%empty { C($$); }
| package_declaration_90_90 attribute_instance { $$ = $1; P($$, $2); }
;

package_declaration_90:
%empty { C($$); }
| package_declaration_90 package_declaration_90_90 package_item { $$ = $1; P($$, $2); P($$, $3); }
;

package_declaration_92:
%empty { C($$); }
| ':' package_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

timeunits_declaration_93:
%empty /* { C($$); } -- ignore */
| '/' time_literal { C($$); T($$, @1, zero, zero); P($$, $2); }
;

parameter_port_list_94:
%empty { C($$); }
| parameter_port_list_94 ',' parameter_port_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

parameter_port_list_95:
%empty { C($$); }
| parameter_port_list_95 ',' parameter_port_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_ports_96:
%empty { C($$); }
| list_of_ports_96 ',' port { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_port_declarations_97_97:
%empty { C($$); }
| list_of_port_declarations_97_97 attribute_instance { $$ = $1; P($$, $2); }
;

list_of_port_declarations_97_98_98:
%empty { C($$); }
| list_of_port_declarations_97_98_98 attribute_instance { $$ = $1; P($$, $2); }
;

list_of_port_declarations_97_98:
%empty { C($$); }
| list_of_port_declarations_97_98 ',' list_of_port_declarations_97_98_98 ansi_port_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

list_of_port_declarations_97:
%empty { C($$); }
| list_of_port_declarations_97_97 ansi_port_declaration list_of_port_declarations_97_98 { $$ = $1; P($$, $2); P($$, $3); }
;

port_declaration_101:
%empty { C($$); }
| port_declaration_101 attribute_instance { $$ = $1; P($$, $2); }
;

port_declaration_102:
%empty { C($$); }
| port_declaration_102 attribute_instance { $$ = $1; P($$, $2); }
;

port_declaration_103:
%empty { C($$); }
| port_declaration_103 attribute_instance { $$ = $1; P($$, $2); }
;

port_declaration_104:
%empty { C($$); }
| port_declaration_104 attribute_instance { $$ = $1; P($$, $2); }
;

port_declaration_105:
%empty { C($$); }
| port_declaration_105 attribute_instance { $$ = $1; P($$, $2); }
;

port_106:
%empty { C($$); }
| port_expression
;

port_107:
%empty { C($$); }
| port_expression
;

port_expression_108:
%empty { C($$); }
| port_expression_108 ',' port_reference { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

net_port_header_109:
%empty { C($$); }
| port_direction
;

variable_port_header_110:
%empty { C($$); }
| port_direction
;

interface_port_header_111:
%empty { C($$); }
| '.' modport_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

interface_port_header_112:
%empty { C($$); }
| '.' modport_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

ansi_port_declaration_113:
%empty /* { C($$); } -- ignore */
| net_port_header
| interface_port_header
;

ansi_port_declaration_114:
%empty { C($$); }
| ansi_port_declaration_114 unpacked_dimension { $$ = $1; P($$, $2); }
;

ansi_port_declaration_115:
%empty { C($$); }
| '=' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

ansi_port_declaration_116:
%empty /* { C($$); } -- ignore */
| variable_port_header
;

ansi_port_declaration_117:
%empty { C($$); }
| ansi_port_declaration_117 variable_dimension { $$ = $1; P($$, $2); }
;

ansi_port_declaration_118:
%empty { C($$); }
| '=' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

ansi_port_declaration_119:
%empty { C($$); }
| port_direction
;

ansi_port_declaration_120:
%empty { C($$); }
| expression
;

elaboration_system_task_121_121:
%empty { C($$); }
| ',' list_of_arguments { C($$); T($$, @1, zero, zero); P($$, $2); }
;

elaboration_system_task_121:
%empty { C($$); }
| '(' finish_number elaboration_system_task_121_121 ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

elaboration_system_task_123_123:
%empty { C($$); }
| list_of_arguments
;

elaboration_system_task_123:
%empty { C($$); }
| '(' elaboration_system_task_123_123 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

elaboration_system_task_125_125:
%empty { C($$); }
| list_of_arguments
;

elaboration_system_task_125:
%empty { C($$); }
| '(' elaboration_system_task_125_125 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

elaboration_system_task_127_127:
%empty { C($$); }
| list_of_arguments
;

elaboration_system_task_127:
%empty { C($$); }
| '(' elaboration_system_task_127_127 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

module_or_generate_item_129:
%empty { C($$); }
| module_or_generate_item_129 attribute_instance { $$ = $1; P($$, $2); }
;

module_or_generate_item_130:
%empty { C($$); }
| module_or_generate_item_130 attribute_instance { $$ = $1; P($$, $2); }
;

module_or_generate_item_131:
%empty { C($$); }
| module_or_generate_item_131 attribute_instance { $$ = $1; P($$, $2); }
;

module_or_generate_item_132:
%empty /* { C($$); } -- ignore */
| module_or_generate_item_132 attribute_instance { $$ = $1; P($$, $2); }
;

module_or_generate_item_133:
%empty { C($$); }
| module_or_generate_item_133 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_module_item_134:
%empty { C($$); }
| non_port_module_item_134 attribute_instance { $$ = $1; P($$, $2); }
;

bind_directive_135:
%empty { C($$); }
| ':' bind_target_instance_list { C($$); T($$, @1, zero, zero); P($$, $2); }
;

bind_target_instance_list_136:
%empty { C($$); }
| bind_target_instance_list_136 ',' bind_target_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

config_declaration_137:
%empty { C($$); }
| config_declaration_137 local_parameter_declaration ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

config_declaration_138:
%empty { C($$); }
| config_declaration_138 config_rule_statement { $$ = $1; P($$, $2); }
;

config_declaration_139:
%empty { C($$); }
| ':' config_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

design_statement_140_140:
%empty /* { C($$); } -- ignore */
| library_identifier '.' { $$ = $1; T($$, @2, zero, zero); }
;

design_statement_140:
%empty { C($$); }
| design_statement_140 design_statement_140_140 cell_identifier { $$ = $1; P($$, $2); P($$, $3); }
;

inst_name_142:
%empty { C($$); }
| inst_name_142 '.' instance_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

cell_clause_143:
%empty /* { C($$); } -- ignore */
| library_identifier '.' { $$ = $1; T($$, @2, zero, zero); }
;

liblist_clause_144:
%empty { C($$); }
| liblist_clause_144 library_identifier { $$ = $1; P($$, $2); }
;

use_clause_145:
%empty /* { C($$); } -- ignore */
| library_identifier '.' { $$ = $1; T($$, @2, zero, zero); }
;

use_clause_146:
%empty { C($$); }
| ':' CONFIG_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

use_clause_147:
%empty { C($$); }
| use_clause_147 ',' named_parameter_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

use_clause_148:
%empty { C($$); }
| ':' CONFIG_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

use_clause_149:
%empty /* { C($$); } -- ignore */
| library_identifier '.' /* { $$ = $1; T($$, @2, zero, zero); } -- ignore */
;

use_clause_150:
%empty { C($$); }
| use_clause_150 ',' named_parameter_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

use_clause_151:
%empty { C($$); }
| ':' CONFIG_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

interface_or_generate_item_152:
%empty { C($$); }
| interface_or_generate_item_152 attribute_instance { $$ = $1; P($$, $2); }
;

interface_or_generate_item_153:
%empty { C($$); }
| interface_or_generate_item_153 attribute_instance { $$ = $1; P($$, $2); }
;

interface_or_generate_item_154:
%empty { C($$); }
| interface_or_generate_item_154 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item_155:
%empty { C($$); }
| non_port_program_item_155 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item_156:
%empty { C($$); }
| non_port_program_item_156 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item_157:
%empty { C($$); }
| non_port_program_item_157 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item_158:
%empty { C($$); }
| non_port_program_item_158 attribute_instance { $$ = $1; P($$, $2); }
;

non_port_program_item_159:
%empty { C($$); }
| non_port_program_item_159 attribute_instance { $$ = $1; P($$, $2); }
;

checker_port_list_160:
%empty { C($$); }
| checker_port_list_160 ',' checker_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

checker_port_item_161:
%empty { C($$); }
| checker_port_item_161 attribute_instance { $$ = $1; P($$, $2); }
;

checker_port_item_162:
%empty { C($$); }
| checker_port_direction
;

checker_port_item_163:
%empty { C($$); }
| checker_port_item_163 variable_dimension { $$ = $1; P($$, $2); }
;

checker_port_item_164:
%empty { C($$); }
| '=' property_actual_arg { C($$); T($$, @1, zero, zero); P($$, $2); }
;

checker_or_generate_item_declaration_165:
%empty { C($$); }
| RAND_ { C($$); T($$, @1, zero, zero); }
;

class_item_166:
%empty { C($$); }
| class_item_166 attribute_instance { $$ = $1; P($$, $2); }
;

class_item_167:
%empty { C($$); }
| class_item_167 attribute_instance { $$ = $1; P($$, $2); }
;

class_item_168:
%empty { C($$); }
| class_item_168 attribute_instance { $$ = $1; P($$, $2); }
;

class_item_169:
%empty { C($$); }
| class_item_169 attribute_instance { $$ = $1; P($$, $2); }
;

class_item_170:
%empty { C($$); }
| class_item_170 attribute_instance { $$ = $1; P($$, $2); }
;

class_property_171:
%empty { C($$); }
| class_property_171 property_qualifier { $$ = $1; P($$, $2); }
;

class_property_172:
%empty { C($$); }
| class_property_172 class_item_qualifier { $$ = $1; P($$, $2); }
;

class_property_173:
%empty { C($$); }
| '=' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

class_method_174:
%empty { C($$); }
| class_method_174 method_qualifier { $$ = $1; P($$, $2); }
;

class_method_175:
%empty { C($$); }
| class_method_175 method_qualifier { $$ = $1; P($$, $2); }
;

class_method_176:
%empty { C($$); }
| class_method_176 class_item_qualifier { $$ = $1; P($$, $2); }
;

class_method_177:
%empty { C($$); }
| class_method_177 method_qualifier { $$ = $1; P($$, $2); }
;

class_method_178:
%empty /* { C($$); } -- ignore */
| class_method_178 method_qualifier { $$ = $1; P($$, $2); }
;

class_method_179:
%empty /* { C($$); } -- ignore */
| class_method_179 method_qualifier { $$ = $1; P($$, $2); }
;

class_constructor_prototype_180_180:
%empty { C($$); }
| tf_port_list
;

class_constructor_prototype_180:
%empty { C($$); }
| '(' class_constructor_prototype_180_180 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

method_qualifier_182:
%empty { C($$); }
| PURE_ { C($$); T($$, @1, zero, zero); }
;

class_constructor_declaration_183:
%empty { C($$); }
| class_scope
;

class_constructor_declaration_184_184:
%empty { C($$); }
| tf_port_list
;

class_constructor_declaration_184:
%empty { C($$); }
| '(' class_constructor_declaration_184_184 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

class_constructor_declaration_186:
%empty { C($$); }
| class_constructor_declaration_186 block_item_declaration { $$ = $1; P($$, $2); }
;

class_constructor_declaration_187_187:
%empty { C($$); }
| '(' list_of_arguments ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

class_constructor_declaration_187:
%empty { C($$); }
| SUPER_ '.' NEW_ class_constructor_declaration_187_187 ';' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

class_constructor_declaration_189:
%empty { C($$); }
| class_constructor_declaration_189 function_statement_or_null { $$ = $1; P($$, $2); }
;

class_constructor_declaration_190:
%empty { C($$); }
| ':' NEW_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

constraint_declaration_191:
%empty { C($$); }
| STATIC_ { C($$); T($$, @1, zero, zero); }
;

constraint_block_192:
%empty { C($$); }
| constraint_block_192 constraint_block_item { $$ = $1; P($$, $2); }
;

solve_before_list_193:
%empty { C($$); }
| solve_before_list_193 ',' constraint_primary { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

constraint_primary_194:
%empty { C($$); }
| implicit_class_handle '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
;

constraint_expression_195:
%empty { C($$); }
| SOFT_ { C($$); T($$, @1, zero, zero); }
;

constraint_expression_196:
%empty { C($$); }
| ELSE_ constraint_set { C($$); T($$, @1, zero, zero); P($$, $2); }
;

constraint_expression_197:
%empty { C($$); }
| loop_variables
;

constraint_set_198:
%empty { C($$); }
| constraint_set_198 constraint_expression { $$ = $1; P($$, $2); }
;

dist_list_199:
%empty { C($$); }
| dist_list_199 ',' dist_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

dist_item_200:
%empty { C($$); }
| dist_weight
;

constraint_prototype_201:
%empty /* { C($$); } -- ignore */
| constraint_prototype_qualifier
;

constraint_prototype_202:
%empty { C($$); }
| STATIC_ { C($$); T($$, @1, zero, zero); }
;

extern_constraint_declaration_203:
%empty { C($$); }
| STATIC_ { C($$); T($$, @1, zero, zero); }
;

identifier_list_204:
%empty { C($$); }
| identifier_list_204 ',' identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

anonymous_program_205:
%empty { C($$); }
| anonymous_program_205 anonymous_program_item { $$ = $1; P($$, $2); }
;

specparam_declaration_206:
%empty { C($$); }
| packed_dimension
;

data_declaration_207:
%empty { C($$); }
| CONST_ { C($$); T($$, @1, zero, zero); }
;

data_declaration_208:
%empty { C($$); }
| VAR_ { C($$); T($$, @1, zero, zero); }
;

data_declaration_209:
%empty { C($$); }
| lifetime
;

package_import_declaration_210:
%empty { C($$); }
| package_import_declaration_210 ',' package_import_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

package_export_declaration_211:
%empty { C($$); }
| package_export_declaration_211 ',' package_import_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

net_declaration_212:
%empty { C($$); }
| drive_strength
| charge_strength
;

net_declaration_213:
%empty { C($$); }
| VECTORED_ { C($$); T($$, @1, zero, zero); }
| SCALARED_ { C($$); T($$, @1, zero, zero); }
;

net_declaration_214:
%empty { C($$); }
| delay3
;

net_declaration_215:
%empty { C($$); }
| delay_control
;

net_declaration_216:
%empty { C($$); }
| '#' delay_value { C($$); T($$, @1, zero, zero); P($$, $2); }
;

net_declaration_217:
%empty { C($$); }
| net_declaration_217 unpacked_dimension { $$ = $1; P($$, $2); }
;

net_declaration_218_218:
%empty { C($$); }
| net_declaration_218_218 unpacked_dimension { $$ = $1; P($$, $2); }
;

net_declaration_218:
%empty { C($$); }
| ',' net_identifier net_declaration_218_218 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

type_declaration_220:
%empty { C($$); }
| type_declaration_220 variable_dimension { $$ = $1; P($$, $2); }
;

type_declaration_221:
%empty /* { C($$); } -- ignore */
| ENUM_ /* { C($$); T($$, @1, zero, zero); } -- ignore */
| STRUCT_ { C($$); T($$, @1, zero, zero); }
| UNION_ { C($$); T($$, @1, zero, zero); }
| CLASS_ { C($$); T($$, @1, zero, zero); }
| INTERFACE_ CLASS_ { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

net_type_declaration_222_222:
%empty /* { C($$); } -- ignore */
| package_scope
| class_scope
;

net_type_declaration_222:
%empty { C($$); }
| WITH_ net_type_declaration_222_222 tf_identifier { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

net_type_declaration_224:
%empty /* { C($$); } -- ignore */
| package_scope
| class_scope
;

data_type_225:
%empty { C($$); }
| signing
;

data_type_226:
%empty { C($$); }
| data_type_226 packed_dimension { $$ = $1; P($$, $2); }
;

data_type_227:
%empty { C($$); }
| signing
;

data_type_228_228:
%empty { C($$); }
| signing
;

data_type_228:
%empty { C($$); }
| PACKED_ data_type_228_228 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

data_type_230:
%empty { C($$); }
| data_type_230 struct_union_member { $$ = $1; P($$, $2); }
;

data_type_231:
%empty { C($$); }
| data_type_231 packed_dimension { $$ = $1; P($$, $2); }
;

data_type_232:
%empty { C($$); }
| enum_base_type
;

data_type_233:
%empty { C($$); }
| data_type_233 ',' enum_name_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

data_type_234:
%empty { C($$); }
| data_type_234 packed_dimension { $$ = $1; P($$, $2); }
;

data_type_235:
%empty { C($$); }
| INTERFACE_ { C($$); T($$, @1, zero, zero); }
;

data_type_236:
%empty { C($$); }
| parameter_value_assignment
;

data_type_237:
%empty { C($$); }
| '.' modport_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

data_type_238:
%empty /* { C($$); } -- ignore */
| class_scope
| package_scope
;

data_type_239:
%empty { C($$); }
| data_type_239 packed_dimension { $$ = $1; P($$, $2); }
;

implicit_data_type_240:
%empty { C($$); }
| signing
;

implicit_data_type_241:
%empty { C($$); }
| implicit_data_type_241 packed_dimension { $$ = $1; P($$, $2); }
;

enum_base_type_242:
%empty { C($$); }
| signing
;

enum_base_type_243:
%empty { C($$); }
| signing
;

enum_base_type_244:
%empty { C($$); }
| packed_dimension
;

enum_base_type_245:
%empty { C($$); }
| packed_dimension
;

enum_name_declaration_246_246:
%empty { C($$); }
| ':' integral_number { C($$); T($$, @1, zero, zero); P($$, $2); }
;

enum_name_declaration_246:
%empty { C($$); }
| '[' integral_number enum_name_declaration_246_246 ']' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

enum_name_declaration_248:
%empty { C($$); }
| '=' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

class_type_249:
%empty { C($$); }
| parameter_value_assignment
;

class_type_250_250:
%empty { C($$); }
| parameter_value_assignment
;

class_type_250:
%empty { C($$); }
| class_type_250 CC class_identifier class_type_250_250 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

net_port_type_252:
%empty { C($$); }
| net_type
;

struct_union_member_253:
%empty { C($$); }
| struct_union_member_253 attribute_instance { $$ = $1; P($$, $2); }
;

struct_union_member_254:
%empty { C($$); }
| random_qualifier
;

struct_union_255:
%empty { C($$); }
| TAGGED_ { C($$); T($$, @1, zero, zero); }
;

delay3_256_256:
%empty { C($$); }
| ',' mintypmax_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

delay3_256:
%empty { C($$); }
| ',' mintypmax_expression delay3_256_256 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

delay2_258:
%empty { C($$); }
| ',' mintypmax_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

list_of_defparam_assignments_259:
%empty { C($$); }
| list_of_defparam_assignments_259 ',' defparam_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_genvar_identifiers_260:
%empty { C($$); }
| list_of_genvar_identifiers_260 ',' genvar_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_interface_identifiers_261:
%empty { C($$); }
| list_of_interface_identifiers_261 unpacked_dimension { $$ = $1; P($$, $2); }
;

list_of_interface_identifiers_262_262:
%empty { C($$); }
| list_of_interface_identifiers_262_262 unpacked_dimension { $$ = $1; P($$, $2); }
;

list_of_interface_identifiers_262:
%empty { C($$); }
| list_of_interface_identifiers_262 ',' interface_identifier list_of_interface_identifiers_262_262 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

list_of_net_decl_assignments_264:
%empty { C($$); }
| list_of_net_decl_assignments_264 ',' net_decl_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_param_assignments_265:
%empty { C($$); }
| list_of_param_assignments_265 ',' param_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_port_identifiers_266:
%empty { C($$); }
| list_of_port_identifiers_266 unpacked_dimension { $$ = $1; P($$, $2); }
;

list_of_port_identifiers_267_267:
%empty { C($$); }
| list_of_port_identifiers_267_267 unpacked_dimension { $$ = $1; P($$, $2); }
;

list_of_port_identifiers_267:
%empty { C($$); }
| list_of_port_identifiers_267 ',' port_identifier list_of_port_identifiers_267_267 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

list_of_udp_port_identifiers_269:
%empty { C($$); }
| list_of_udp_port_identifiers_269 ',' port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_specparam_assignments_270:
%empty { C($$); }
| list_of_specparam_assignments_270 ',' specparam_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_tf_variable_identifiers_271:
%empty { C($$); }
| list_of_tf_variable_identifiers_271 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_tf_variable_identifiers_272:
%empty { C($$); }
| '=' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

list_of_tf_variable_identifiers_273_273:
%empty { C($$); }
| list_of_tf_variable_identifiers_273_273 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_tf_variable_identifiers_273_274:
%empty { C($$); }
| '=' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

list_of_tf_variable_identifiers_273:
%empty { C($$); }
| list_of_tf_variable_identifiers_273 ',' port_identifier list_of_tf_variable_identifiers_273_273 list_of_tf_variable_identifiers_273_274 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

list_of_type_assignments_276:
%empty { C($$); }
| list_of_type_assignments_276 ',' type_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_variable_decl_assignments_277:
%empty { C($$); }
| list_of_variable_decl_assignments_277 ',' variable_decl_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_variable_identifiers_278:
%empty { C($$); }
| list_of_variable_identifiers_278 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_variable_identifiers_279_279:
%empty { C($$); }
| list_of_variable_identifiers_279_279 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_variable_identifiers_279:
%empty { C($$); }
| list_of_variable_identifiers_279 ',' variable_identifier list_of_variable_identifiers_279_279 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

list_of_variable_port_identifiers_281:
%empty { C($$); }
| list_of_variable_port_identifiers_281 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_variable_port_identifiers_282:
%empty { C($$); }
| '=' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

list_of_variable_port_identifiers_283_283:
%empty { C($$); }
| list_of_variable_port_identifiers_283_283 variable_dimension { $$ = $1; P($$, $2); }
;

list_of_variable_port_identifiers_283_284:
%empty { C($$); }
| '=' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

list_of_variable_port_identifiers_283:
%empty { C($$); }
| list_of_variable_port_identifiers_283 ',' port_identifier list_of_variable_port_identifiers_283_283 list_of_variable_port_identifiers_283_284 { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); P($$, $5); }
;

net_decl_assignment_286:
%empty { C($$); }
| net_decl_assignment_286 unpacked_dimension { $$ = $1; P($$, $2); }
;

net_decl_assignment_287:
%empty { C($$); }
| '=' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

param_assignment_288:
%empty { C($$); }
| param_assignment_288 unpacked_dimension { $$ = $1; P($$, $2); }
;

param_assignment_289:
%empty { C($$); }
| '=' constant_param_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

type_assignment_290:
%empty { C($$); }
| '=' data_type { C($$); T($$, @1, zero, zero); P($$, $2); }
;

pulse_control_specparam_291:
%empty { C($$); }
| ',' error_limit_value { C($$); T($$, @1, zero, zero); P($$, $2); }
;

pulse_control_specparam_292:
%empty { C($$); }
| ',' error_limit_value { C($$); T($$, @1, zero, zero); P($$, $2); }
;

variable_decl_assignment_293:
%empty /* { C($$); } -- ignore */
| variable_decl_assignment_293 variable_dimension { $$ = $1; P($$, $2); }
;

variable_decl_assignment_294:
%empty { C($$); }
| '=' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

variable_decl_assignment_295:
%empty { C($$); }
| variable_decl_assignment_295 variable_dimension { $$ = $1; P($$, $2); }
;

variable_decl_assignment_296:
%empty { C($$); }
| '=' dynamic_array_new { C($$); T($$, @1, zero, zero); P($$, $2); }
;

variable_decl_assignment_297:
%empty { C($$); }
| '=' class_new { C($$); T($$, @1, zero, zero); P($$, $2); }
;

class_new_298:
%empty /* { C($$); } -- ignore */
| class_scope
;

class_new_299:
%empty { C($$); }
| '(' list_of_arguments ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

dynamic_array_new_300:
%empty { C($$); }
| '(' expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

queue_dimension_301:
%empty { C($$); }
| ':' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

function_declaration_302:
%empty { C($$); }
| lifetime
;

function_body_declaration_303:
%empty /* { C($$); } -- ignore */
| interface_identifier '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
;

function_body_declaration_304:
%empty { C($$); }
| function_body_declaration_304 tf_item_declaration { $$ = $1; P($$, $2); }
;

function_body_declaration_305:
%empty { C($$); }
| function_body_declaration_305 function_statement_or_null { $$ = $1; P($$, $2); }
;

function_body_declaration_306:
%empty { C($$); }
| ':' function_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

function_body_declaration_307:
%empty /* { C($$); } -- ignore */
| interface_identifier '.' /* { $$ = $1; T($$, @2, zero, zero); } -- ignore */
| class_scope /* ignore */
;

function_body_declaration_308:
%empty { C($$); }
| tf_port_list
;

function_body_declaration_309:
%empty { C($$); }
| function_body_declaration_309 block_item_declaration { $$ = $1; P($$, $2); }
;

function_body_declaration_310:
%empty { C($$); }
| function_body_declaration_310 function_statement_or_null { $$ = $1; P($$, $2); }
;

function_body_declaration_311:
%empty { C($$); }
| ':' function_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

function_prototype_312_312:
%empty { C($$); }
| tf_port_list
;

function_prototype_312:
%empty { C($$); }
| '(' function_prototype_312_312 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

dpi_import_export_314:
%empty { C($$); }
| dpi_function_import_property
;

dpi_import_export_315:
%empty { C($$); }
| c_identifier '=' { $$ = $1; T($$, @2, zero, zero); }
;

dpi_import_export_316:
%empty { C($$); }
| dpi_task_import_property
;

dpi_import_export_317:
%empty { C($$); }
| c_identifier '=' { $$ = $1; T($$, @2, zero, zero); }
;

dpi_import_export_318:
%empty { C($$); }
| c_identifier '=' { $$ = $1; T($$, @2, zero, zero); }
;

dpi_import_export_319:
%empty { C($$); }
| c_identifier '=' { $$ = $1; T($$, @2, zero, zero); }
;

task_declaration_320:
%empty { C($$); }
| lifetime
;

task_body_declaration_321:
%empty /* { C($$); } -- ignore */
| interface_identifier '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
;

task_body_declaration_322:
%empty { C($$); }
| task_body_declaration_322 tf_item_declaration { $$ = $1; P($$, $2); }
;

task_body_declaration_323:
%empty { C($$); }
| task_body_declaration_323 statement_or_null { $$ = $1; P($$, $2); }
;

task_body_declaration_324:
%empty { C($$); }
| ':' task_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

task_body_declaration_325:
%empty /* { C($$); } -- ignore */
| interface_identifier '.' /* { $$ = $1; T($$, @2, zero, zero); } -- ignore */
| class_scope /* ignore */
;

task_body_declaration_326:
%empty { C($$); }
| tf_port_list
;

task_body_declaration_327:
%empty { C($$); }
| task_body_declaration_327 block_item_declaration { $$ = $1; P($$, $2); }
;

task_body_declaration_328:
%empty { C($$); }
| task_body_declaration_328 statement_or_null { $$ = $1; P($$, $2); }
;

task_body_declaration_329:
%empty { C($$); }
| ':' task_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

tf_port_list_330:
%empty { C($$); }
| tf_port_list_330 ',' tf_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

tf_port_item_331:
%empty { C($$); }
| tf_port_item_331 attribute_instance { $$ = $1; P($$, $2); }
;

tf_port_item_332:
%empty { C($$); }
| tf_port_direction
;

tf_port_item_333:
%empty { C($$); }
| VAR_ { C($$); T($$, @1, zero, zero); }
;

tf_port_item_334_334:
%empty { C($$); }
| tf_port_item_334_334 variable_dimension { $$ = $1; P($$, $2); }
;

tf_port_item_334_335:
%empty { C($$); }
| '=' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

tf_port_item_334:
%empty { C($$); }
| port_identifier tf_port_item_334_334 tf_port_item_334_335 { $$ = $1; P($$, $2); P($$, $3); }
;

tf_port_declaration_337:
%empty { C($$); }
| tf_port_declaration_337 attribute_instance { $$ = $1; P($$, $2); }
;

tf_port_declaration_338:
%empty { C($$); }
| VAR_ { C($$); T($$, @1, zero, zero); }
;

task_prototype_339_339:
%empty /* { C($$); } -- ignore */
| tf_port_list
;

task_prototype_339:
%empty { C($$); }
| '(' task_prototype_339_339 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

block_item_declaration_341:
%empty { C($$); }
| block_item_declaration_341 attribute_instance { $$ = $1; P($$, $2); }
;

block_item_declaration_342:
%empty { C($$); }
| block_item_declaration_342 attribute_instance { $$ = $1; P($$, $2); }
;

block_item_declaration_343:
%empty { C($$); }
| block_item_declaration_343 attribute_instance { $$ = $1; P($$, $2); }
;

block_item_declaration_344:
%empty { C($$); }
| block_item_declaration_344 attribute_instance { $$ = $1; P($$, $2); }
;

block_item_declaration_345:
%empty { C($$); }
| block_item_declaration_345 attribute_instance { $$ = $1; P($$, $2); }
;

overload_proto_formals_346:
%empty { C($$); }
| overload_proto_formals_346 ',' data_type { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

modport_declaration_347:
%empty { C($$); }
| modport_declaration_347 ',' modport_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

modport_item_348:
%empty { C($$); }
| modport_item_348 ',' modport_ports_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

modport_ports_declaration_349:
%empty { C($$); }
| modport_ports_declaration_349 attribute_instance { $$ = $1; P($$, $2); }
;

modport_ports_declaration_350:
%empty { C($$); }
| modport_ports_declaration_350 attribute_instance { $$ = $1; P($$, $2); }
;

modport_ports_declaration_351:
%empty { C($$); }
| modport_ports_declaration_351 attribute_instance { $$ = $1; P($$, $2); }
;

modport_simple_ports_declaration_352:
%empty { C($$); }
| modport_simple_ports_declaration_352 ',' modport_simple_port { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

modport_simple_port_353:
%empty { C($$); }
| expression
;

modport_tf_ports_declaration_354:
%empty { C($$); }
| modport_tf_ports_declaration_354 ',' modport_tf_port { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

concurrent_assertion_item_355:
%empty { C($$); }
| block_identifier ':' { $$ = $1; T($$, @2, zero, zero); }
;

cover_sequence_statement_356:
%empty { C($$); }
| clocking_event
;

cover_sequence_statement_357:
%empty { C($$); }
| DISABLE_ IFF_ '(' expression_or_dist ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

property_instance_358_358:
%empty { C($$); }
| property_list_of_arguments
;

property_instance_358:
%empty { C($$); }
| '(' property_instance_358_358 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

property_list_of_arguments_360:
%empty { C($$); }
| property_actual_arg
;

property_list_of_arguments_361_361:
%empty { C($$); }
| property_actual_arg
;

property_list_of_arguments_361:
%empty { C($$); }
| property_list_of_arguments_361 ',' property_list_of_arguments_361_361 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

property_list_of_arguments_363_363:
%empty { C($$); }
| property_actual_arg
;

property_list_of_arguments_363:
%empty { C($$); }
| property_list_of_arguments_363 ',' '.' identifier '(' property_list_of_arguments_363_363 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

property_list_of_arguments_365:
%empty { C($$); }
| property_actual_arg
;

property_list_of_arguments_366_366:
%empty { C($$); }
| property_actual_arg
;

property_list_of_arguments_366:
%empty { C($$); }
| property_list_of_arguments_366 ',' '.' identifier '(' property_list_of_arguments_366_366 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

property_declaration_368_368:
%empty { C($$); }
| property_port_list
;

property_declaration_368:
%empty { C($$); }
| '(' property_declaration_368_368 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

property_declaration_370:
%empty { C($$); }
| property_declaration_370 assertion_variable_declaration { $$ = $1; P($$, $2); }
;

property_declaration_371:
%empty { C($$); }
| ';' { C($$); T($$, @1, zero, zero); }
;

property_declaration_372:
%empty { C($$); }
| ':' property_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

property_port_list_373:
%empty { C($$); }
| property_port_list_373 ',' property_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

property_port_item_374:
%empty { C($$); }
| property_port_item_374 attribute_instance { $$ = $1; P($$, $2); }
;

property_port_item_375_375:
%empty { C($$); }
| property_lvar_port_direction
;

property_port_item_375:
%empty { C($$); }
| LOCAL_ property_port_item_375_375 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

property_port_item_377:
%empty { C($$); }
| property_port_item_377 variable_dimension { $$ = $1; P($$, $2); }
;

property_port_item_378:
%empty { C($$); }
| '=' property_actual_arg { C($$); T($$, @1, zero, zero); P($$, $2); }
;

property_spec_379:
%empty { C($$); }
| clocking_event
;

property_spec_380:
%empty { C($$); }
| DISABLE_ IFF_ '(' expression_or_dist ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

property_expr_381:
%empty { C($$); }
| ELSE_ property_expr { C($$); T($$, @1, zero, zero); P($$, $2); }
;

property_expr_382:
%empty { C($$); }
| property_expr_382 property_case_item { $$ = $1; P($$, $2); }
;

property_expr_383:
%empty { C($$); }
| CONSTANT_ expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

property_expr_384:
%empty { C($$); }
| constant_expression
;

property_expr_385:
%empty { C($$); }
| cycle_delay_const_range_expression
;

property_expr_386:
%empty { C($$); }
| constant_range
;

property_expr_387:
%empty { C($$); }
| constant_range
;

property_expr_388:
%empty { C($$); }
| cycle_delay_const_range_expression
;

property_case_item_389:
%empty { C($$); }
| property_case_item_389 ',' expression_or_dist { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

property_case_item_390:
%empty { C($$); }
| ';' { C($$); T($$, @1, zero, zero); }
;

property_case_item_391:
%empty { C($$); }
| ':' { C($$); T($$, @1, zero, zero); }
;

property_case_item_392:
%empty { C($$); }
| ';' { C($$); T($$, @1, zero, zero); }
;

sequence_declaration_393_393:
%empty { C($$); }
| sequence_port_list
;

sequence_declaration_393:
%empty { C($$); }
| '(' sequence_declaration_393_393 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

sequence_declaration_395:
%empty { C($$); }
| sequence_declaration_395 assertion_variable_declaration { $$ = $1; P($$, $2); }
;

sequence_declaration_396:
%empty { C($$); }
| ';' { C($$); T($$, @1, zero, zero); }
;

sequence_declaration_397:
%empty { C($$); }
| ':' sequence_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

sequence_port_list_398:
%empty { C($$); }
| sequence_port_list_398 ',' sequence_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequence_port_item_399:
%empty { C($$); }
| sequence_port_item_399 attribute_instance { $$ = $1; P($$, $2); }
;

sequence_port_item_400_400:
%empty { C($$); }
| sequence_lvar_port_direction
;

sequence_port_item_400:
%empty { C($$); }
| LOCAL_ sequence_port_item_400_400 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

sequence_port_item_402:
%empty { C($$); }
| sequence_port_item_402 variable_dimension { $$ = $1; P($$, $2); }
;

sequence_port_item_403:
%empty { C($$); }
| '=' sequence_actual_arg { C($$); T($$, @1, zero, zero); P($$, $2); }
;

sequence_expr_404:
%empty { C($$); }
| sequence_expr_404 cycle_delay_range sequence_expr { $$ = $1; P($$, $2); P($$, $3); }
;

sequence_expr_405:
%empty { C($$); }
| sequence_expr_405 cycle_delay_range sequence_expr { $$ = $1; P($$, $2); P($$, $3); }
;

sequence_expr_406:
%empty { C($$); }
| boolean_abbrev
;

sequence_expr_407:
%empty { C($$); }
| sequence_abbrev
;

sequence_expr_408:
%empty { C($$); }
| sequence_expr_408 ',' sequence_match_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequence_expr_409:
%empty { C($$); }
| sequence_abbrev
;

sequence_expr_410:
%empty { C($$); }
| sequence_expr_410 ',' sequence_match_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequence_instance_411_411:
%empty { C($$); }
| sequence_list_of_arguments
;

sequence_instance_411:
%empty { C($$); }
| '(' sequence_instance_411_411 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

sequence_list_of_arguments_413:
%empty { C($$); }
| sequence_actual_arg
;

sequence_list_of_arguments_414_414:
%empty { C($$); }
| sequence_actual_arg
;

sequence_list_of_arguments_414:
%empty { C($$); }
| sequence_list_of_arguments_414 ',' sequence_list_of_arguments_414_414 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

sequence_list_of_arguments_416_416:
%empty { C($$); }
| sequence_actual_arg
;

sequence_list_of_arguments_416:
%empty { C($$); }
| sequence_list_of_arguments_416 ',' '.' identifier '(' sequence_list_of_arguments_416_416 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

sequence_list_of_arguments_418:
%empty { C($$); }
| sequence_actual_arg
;

sequence_list_of_arguments_419_419:
%empty { C($$); }
| sequence_actual_arg
;

sequence_list_of_arguments_419:
%empty { C($$); }
| sequence_list_of_arguments_419 ',' '.' identifier '(' sequence_list_of_arguments_419_419 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

expression_or_dist_421_421:
%empty { C($$); }
| expression_or_dist_421_421 dist_list { $$ = $1; P($$, $2); }
;

expression_or_dist_421:
%empty { C($$); }
| DIST_ expression_or_dist_421_421 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

let_declaration_423_423:
%empty { C($$); }
| let_port_list
;

let_declaration_423:
%empty { C($$); }
| '(' let_declaration_423_423 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

let_port_list_425:
%empty { C($$); }
| let_port_list_425 ',' let_port_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

let_port_item_426:
%empty { C($$); }
| let_port_item_426 attribute_instance { $$ = $1; P($$, $2); }
;

let_port_item_427:
%empty { C($$); }
| let_port_item_427 variable_dimension { $$ = $1; P($$, $2); }
;

let_port_item_428:
%empty { C($$); }
| '=' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

let_expression_429:
%empty /* { C($$); } -- ignore */
| package_scope
;

let_expression_430_430:
%empty { C($$); }
| let_list_of_arguments
;

let_expression_430:
%empty { C($$); }
| '(' let_expression_430_430 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

let_list_of_arguments_432:
%empty { C($$); }
| let_actual_arg
;

let_list_of_arguments_433_433:
%empty { C($$); }
| let_actual_arg
;

let_list_of_arguments_433:
%empty { C($$); }
| let_list_of_arguments_433 ',' let_list_of_arguments_433_433 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

let_list_of_arguments_435_435:
%empty { C($$); }
| let_actual_arg
;

let_list_of_arguments_435:
%empty { C($$); }
| let_list_of_arguments_435 ',' '.' identifier '(' let_list_of_arguments_435_435 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

let_list_of_arguments_437:
%empty { C($$); }
| let_actual_arg
;

let_list_of_arguments_438_438:
%empty { C($$); }
| let_actual_arg
;

let_list_of_arguments_438:
%empty { C($$); }
| let_list_of_arguments_438 ',' '.' identifier '(' let_list_of_arguments_438_438 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

covergroup_declaration_440_440:
%empty /* { C($$); } -- ignore */
| tf_port_list
;

covergroup_declaration_440:
%empty { C($$); }
| '(' covergroup_declaration_440_440 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

covergroup_declaration_442:
%empty { C($$); }
| coverage_event
;

covergroup_declaration_443:
%empty { C($$); }
| covergroup_declaration_443 coverage_spec_or_option { $$ = $1; P($$, $2); }
;

covergroup_declaration_444:
%empty { C($$); }
| ':' covergroup_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

coverage_spec_or_option_445:
%empty { C($$); }
| coverage_spec_or_option_445 attribute_instance { $$ = $1; P($$, $2); }
;

coverage_spec_or_option_446:
%empty { C($$); }
| coverage_spec_or_option_446 attribute_instance { $$ = $1; P($$, $2); }
;

coverage_event_447:
%empty /* { C($$); } -- ignore */
| tf_port_list
;

hierarchical_btf_identifier_448:
%empty /* { C($$); } -- ignore */
| hierarchical_identifier '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
;

cover_point_449_449:
%empty /* { C($$); } -- ignore */
| data_type_or_implicit
;

cover_point_449:
%empty { C($$); }
| cover_point_449_449 cover_point_identifier ':' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

cover_point_451:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_or_empty_452_452:
%empty { C($$); }
| bins_or_empty_452_452 attribute_instance { $$ = $1; P($$, $2); }
;

bins_or_empty_452_453:
%empty { C($$); }
| bins_or_empty_452_453 bins_or_options ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

bins_or_empty_452:
%empty { C($$); }
| bins_or_empty_452 bins_or_empty_452_452 bins_or_empty_452_453 { $$ = $1; P($$, $2); P($$, $3); }
;

bins_or_options_455:
%empty /* { C($$); } -- ignore */
| WILDCARD_ { C($$); T($$, @1, zero, zero); }
;

bins_or_options_456_456:
%empty { C($$); }
| covergroup_expression
;

bins_or_options_456:
%empty { C($$); }
| '[' bins_or_options_456_456 ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

bins_or_options_458:
%empty { C($$); }
| WITH_ '(' with_covergroup_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_or_options_459:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_or_options_460:
%empty /* { C($$); } -- ignore */
| WILDCARD_ /* { C($$); T($$, @1, zero, zero); } -- ignore */
;

bins_or_options_461_461:
%empty { C($$); }
| covergroup_expression
;

bins_or_options_461:
%empty { C($$); }
| '[' bins_or_options_461_461 ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

bins_or_options_463:
%empty { C($$); }
| WITH_ '(' with_covergroup_expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_or_options_464:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_or_options_465:
%empty /* { C($$); } -- ignore */
| WILDCARD_ /* { C($$); T($$, @1, zero, zero); } -- ignore */
;

bins_or_options_466_466:
%empty { C($$); }
| covergroup_expression
;

bins_or_options_466:
%empty { C($$); }
| '[' bins_or_options_466_466 ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

bins_or_options_468:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_or_options_469:
%empty /* { C($$); } -- ignore */
| WILDCARD_ /* { C($$); T($$, @1, zero, zero); } -- ignore */
;

bins_or_options_470:
%empty { C($$); }
| '[' ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

bins_or_options_471:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_or_options_472_472_472:
%empty /* { C($$); } -- ignore */
| covergroup_expression
;

bins_or_options_472_472:
%empty /* { C($$); } -- ignore */
| bins_or_options_472_472_472
;

bins_or_options_472:
%empty /* { C($$); } -- ignore */
| bins_or_options_472_472
;

bins_or_options_475:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_or_options_476:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

trans_list_477:
%empty { C($$); }
| trans_list_477 ',' '(' trans_set ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

trans_set_478:
%empty { C($$); }
| trans_set_478 EG trans_range_list { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

cover_cross_479:
%empty { C($$); }
| cross_identifier ':' { $$ = $1; T($$, @2, zero, zero); }
;

cover_cross_480:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

list_of_cross_items_481:
%empty { C($$); }
| list_of_cross_items_481 ',' cross_item { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

cross_body_482:
%empty { C($$); }
| cross_body_482 cross_body_item ';' { $$ = $1; P($$, $2); T($$, @3, zero, zero); }
;

bins_selection_or_option_483:
%empty { C($$); }
| bins_selection_or_option_483 attribute_instance { $$ = $1; P($$, $2); }
;

bins_selection_or_option_484:
%empty { C($$); }
| bins_selection_or_option_484 attribute_instance { $$ = $1; P($$, $2); }
;

bins_selection_485:
%empty { C($$); }
| IFF_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

select_expression_486:
%empty { C($$); }
| MATCHES_ integer_covergroup_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

select_expression_487:
%empty { C($$); }
| MATCHES_ integer_covergroup_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

select_condition_488:
%empty { C($$); }
| INTERSECT_ '{' covergroup_range_list '}' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

bins_expression_489:
%empty { C($$); }
| '.' bin_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

covergroup_range_list_490:
%empty { C($$); }
| covergroup_range_list_490 ',' covergroup_value_range { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_491:
%empty { C($$); }
| delay3
;

gate_instantiation_492:
%empty { C($$); }
| gate_instantiation_492 ',' cmos_switch_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_493:
%empty { C($$); }
| drive_strength
;

gate_instantiation_494:
%empty { C($$); }
| delay3
;

gate_instantiation_495:
%empty { C($$); }
| gate_instantiation_495 ',' enable_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_496:
%empty { C($$); }
| delay3
;

gate_instantiation_497:
%empty { C($$); }
| gate_instantiation_497 ',' mos_switch_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_498:
%empty { C($$); }
| drive_strength
;

gate_instantiation_499:
%empty { C($$); }
| delay2
;

gate_instantiation_500:
%empty { C($$); }
| gate_instantiation_500 ',' n_input_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_501:
%empty { C($$); }
| drive_strength
;

gate_instantiation_502:
%empty { C($$); }
| delay2
;

gate_instantiation_503:
%empty { C($$); }
| gate_instantiation_503 ',' n_output_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_504:
%empty { C($$); }
| delay2
;

gate_instantiation_505:
%empty { C($$); }
| gate_instantiation_505 ',' pass_enable_switch_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_506:
%empty { C($$); }
| gate_instantiation_506 ',' pass_switch_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_507:
%empty { C($$); }
| pulldown_strength
;

gate_instantiation_508:
%empty { C($$); }
| gate_instantiation_508 ',' pull_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

gate_instantiation_509:
%empty { C($$); }
| pullup_strength
;

gate_instantiation_510:
%empty { C($$); }
| gate_instantiation_510 ',' pull_gate_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

cmos_switch_instance_511:
%empty { C($$); }
| name_of_instance
;

enable_gate_instance_512:
%empty { C($$); }
| name_of_instance
;

mos_switch_instance_513:
%empty { C($$); }
| name_of_instance
;

n_input_gate_instance_514:
%empty { C($$); }
| name_of_instance
;

n_input_gate_instance_515:
%empty { C($$); }
| n_input_gate_instance_515 ',' input_terminal { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

n_output_gate_instance_516:
%empty { C($$); }
| name_of_instance
;

n_output_gate_instance_517:
%empty { C($$); }
| n_output_gate_instance_517 ',' output_terminal { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

pass_switch_instance_518:
%empty { C($$); }
| name_of_instance
;

pass_enable_switch_instance_519:
%empty { C($$); }
| name_of_instance
;

pull_gate_instance_520:
%empty { C($$); }
| name_of_instance
;

module_instantiation_521:
%empty { C($$); }
| parameter_value_assignment
;

module_instantiation_522:
%empty { C($$); }
| module_instantiation_522 ',' hierarchical_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

parameter_value_assignment_523:
%empty { C($$); }
| list_of_parameter_assignments
;

list_of_parameter_assignments_524:
%empty { C($$); }
| list_of_parameter_assignments_524 ',' ordered_parameter_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_parameter_assignments_525:
%empty { C($$); }
| list_of_parameter_assignments_525 ',' named_parameter_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

named_parameter_assignment_526:
%empty { C($$); }
| param_expression
;

hierarchical_instance_527:
%empty { C($$); }
| list_of_port_connections
;

name_of_instance_528:
%empty { C($$); }
| name_of_instance_528 unpacked_dimension { $$ = $1; P($$, $2); }
;

list_of_port_connections_529:
%empty { C($$); }
| list_of_port_connections_529 ',' ordered_port_connection { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_port_connections_530:
%empty { C($$); }
| list_of_port_connections_530 ',' named_port_connection { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

ordered_port_connection_531:
%empty { C($$); }
| ordered_port_connection_531 attribute_instance { $$ = $1; P($$, $2); }
;

ordered_port_connection_532:
%empty { C($$); }
| expression
;

named_port_connection_533:
%empty { C($$); }
| named_port_connection_533 attribute_instance { $$ = $1; P($$, $2); }
;

named_port_connection_534_534:
%empty { C($$); }
| expression
;

named_port_connection_534:
%empty { C($$); }
| '(' named_port_connection_534_534 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

named_port_connection_536:
%empty { C($$); }
| named_port_connection_536 attribute_instance { $$ = $1; P($$, $2); }
;

interface_instantiation_537:
%empty { C($$); }
| parameter_value_assignment
;

interface_instantiation_538:
%empty { C($$); }
| interface_instantiation_538 ',' hierarchical_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

program_instantiation_539:
%empty { C($$); }
| parameter_value_assignment
;

program_instantiation_540:
%empty { C($$); }
| program_instantiation_540 ',' hierarchical_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

checker_instantiation_541:
%empty { C($$); }
| list_of_checker_port_connections
;

list_of_checker_port_connections_542:
%empty { C($$); }
| list_of_checker_port_connections_542 ',' ordered_checker_port_connection { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_checker_port_connections_543:
%empty { C($$); }
| list_of_checker_port_connections_543 ',' named_checker_port_connection { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

ordered_checker_port_connection_544:
%empty { C($$); }
| ordered_checker_port_connection_544 attribute_instance { $$ = $1; P($$, $2); }
;

ordered_checker_port_connection_545:
%empty { C($$); }
| property_actual_arg
;

named_checker_port_connection_546:
%empty { C($$); }
| named_checker_port_connection_546 attribute_instance { $$ = $1; P($$, $2); }
;

named_checker_port_connection_547_547:
%empty { C($$); }
| property_actual_arg
;

named_checker_port_connection_547:
%empty { C($$); }
| '(' named_checker_port_connection_547_547 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

named_checker_port_connection_549:
%empty { C($$); }
| named_checker_port_connection_549 attribute_instance { $$ = $1; P($$, $2); }
;

generate_region_550:
%empty { C($$); }
| generate_region_550 generate_item { $$ = $1; P($$, $2); }
;

genvar_initialization_551:
%empty { C($$); }
| GENVAR_ { C($$); T($$, @1, zero, zero); }
;

if_generate_construct_552:
%empty { C($$); }
| ELSE_ generate_block { C($$); T($$, @1, zero, zero); P($$, $2); }
;

case_generate_construct_553:
%empty { C($$); }
| case_generate_construct_553 case_generate_item { $$ = $1; P($$, $2); }
;

case_generate_item_554:
%empty { C($$); }
| case_generate_item_554 ',' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

case_generate_item_555:
%empty { C($$); }
| ':' { C($$); T($$, @1, zero, zero); }
;

generate_block_556:
%empty { C($$); }
| generate_block_identifier ':' { $$ = $1; T($$, @2, zero, zero); }
;

generate_block_557:
%empty { C($$); }
| ':' generate_block_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

generate_block_558:
%empty { C($$); }
| generate_block_558 generate_item { $$ = $1; P($$, $2); }
;

generate_block_559:
%empty { C($$); }
| ':' generate_block_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

udp_nonansi_declaration_560:
%empty { C($$); }
| udp_nonansi_declaration_560 attribute_instance { $$ = $1; P($$, $2); }
;

udp_ansi_declaration_561:
%empty /* { C($$); } -- ignore */
| udp_ansi_declaration_561 attribute_instance { $$ = $1; P($$, $2); }
;

udp_declaration_562:
%empty { C($$); }
| udp_declaration_562 udp_port_declaration { $$ = $1; P($$, $2); }
;

udp_declaration_563:
%empty { C($$); }
| ':' udp_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

udp_declaration_564:
%empty { C($$); }
| ':' udp_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

udp_declaration_565:
%empty /* { C($$); } -- ignore */
| udp_declaration_565 attribute_instance { $$ = $1; P($$, $2); }
;

udp_declaration_566:
%empty { C($$); }
| udp_declaration_566 udp_port_declaration { $$ = $1; P($$, $2); }
;

udp_declaration_567:
%empty { C($$); }
| ':' udp_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

udp_port_list_568:
%empty { C($$); }
| udp_port_list_568 ',' input_port_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_declaration_port_list_569:
%empty { C($$); }
| udp_declaration_port_list_569 ',' udp_input_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_output_declaration_570:
%empty { C($$); }
| udp_output_declaration_570 attribute_instance { $$ = $1; P($$, $2); }
;

udp_output_declaration_571:
%empty /* { C($$); } -- ignore */
| udp_output_declaration_571 attribute_instance { $$ = $1; P($$, $2); }
;

udp_output_declaration_572:
%empty { C($$); }
| '=' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

udp_input_declaration_573:
%empty { C($$); }
| udp_input_declaration_573 attribute_instance { $$ = $1; P($$, $2); }
;

udp_reg_declaration_574:
%empty { C($$); }
| udp_reg_declaration_574 attribute_instance { $$ = $1; P($$, $2); }
;

combinational_body_575:
%empty { C($$); }
| combinational_body_575 combinational_entry { $$ = $1; P($$, $2); }
;

sequential_body_576:
%empty /* { C($$); } -- ignore */
| udp_initial_statement
;

sequential_body_577:
%empty { C($$); }
| sequential_body_577 sequential_entry { $$ = $1; P($$, $2); }
;

level_input_list_578:
%empty { C($$); }
| level_input_list_578 level_symbol { $$ = $1; P($$, $2); }
;

edge_input_list_579:
%empty { C($$); }
| edge_input_list_579 level_symbol { $$ = $1; P($$, $2); }
;

edge_input_list_580:
%empty { C($$); }
| edge_input_list_580 level_symbol { $$ = $1; P($$, $2); }
;

udp_instantiation_581:
%empty { C($$); }
| drive_strength
;

udp_instantiation_582:
%empty { C($$); }
| delay2
;

udp_instantiation_583:
%empty { C($$); }
| udp_instantiation_583 ',' udp_instance { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

udp_instance_584:
%empty { C($$); }
| name_of_instance
;

udp_instance_585:
%empty { C($$); }
| udp_instance_585 ',' input_terminal { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

continuous_assign_586:
%empty { C($$); }
| drive_strength
;

continuous_assign_587:
%empty { C($$); }
| delay3
;

continuous_assign_588:
%empty { C($$); }
| delay_control
;

list_of_net_assignments_589:
%empty { C($$); }
| list_of_net_assignments_589 ',' net_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_variable_assignments_590:
%empty { C($$); }
| list_of_variable_assignments_590 ',' variable_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

net_alias_591:
%empty { C($$); }
| net_alias_591 '=' net_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

blocking_assignment_592:
%empty /* { C($$); } -- ignore */
| implicit_class_handle '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
| package_scope
;

nonblocking_assignment_593:
%empty { C($$); }
| delay_or_event_control
;

action_block_594:
%empty { C($$); }
| statement /* ignore */
;

seq_block_595:
%empty { C($$); }
| ':' block_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

seq_block_596:
%empty { C($$); }
| seq_block_596 block_item_declaration { $$ = $1; P($$, $2); }
;

seq_block_597:
%empty { C($$); }
| seq_block_597 statement_or_null { $$ = $1; P($$, $2); }
;

seq_block_598:
%empty { C($$); }
| ':' block_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

par_block_599:
%empty { C($$); }
| ':' block_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

par_block_600:
%empty { C($$); }
| par_block_600 block_item_declaration { $$ = $1; P($$, $2); }
;

par_block_601:
%empty { C($$); }
| par_block_601 statement_or_null { $$ = $1; P($$, $2); }
;

par_block_602:
%empty { C($$); }
| ':' block_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

statement_or_null_603:
%empty { C($$); }
| statement_or_null_603 attribute_instance { $$ = $1; P($$, $2); }
;

statement_604:
%empty { C($$); }
| block_identifier ':' { $$ = $1; T($$, @2, zero, zero); }
;

statement_605:
%empty { C($$); }
| statement_605 attribute_instance { $$ = $1; P($$, $2); }
;

function_statement_or_null_606:
%empty { C($$); }
| function_statement_or_null_606 attribute_instance { $$ = $1; P($$, $2); }
;

variable_identifier_list_607:
%empty { C($$); }
| variable_identifier_list_607 ',' variable_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

event_expression_608:
%empty { C($$); }
| edge_identifier
;

event_expression_609:
%empty { C($$); }
| IFF_ expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

event_expression_610:
%empty { C($$); }
| IFF_ expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

jump_statement_611:
%empty { C($$); }
| expression
;

wait_statement_612:
%empty { C($$); }
| wait_statement_612 ',' hierarchical_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

event_trigger_613:
%empty { C($$); }
| delay_or_event_control
;

conditional_statement_614:
%empty { C($$); }
| unique_priority
;

conditional_statement_615:
%empty { C($$); }
| conditional_statement_615 ELSE_ IF_ '(' cond_predicate ')' statement_or_null { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, zero, zero); P($$, $7); }
;

conditional_statement_616:
%empty { C($$); }
| ELSE_ statement_or_null { C($$); T($$, @1, zero, zero); P($$, $2); }
;

cond_predicate_617:
%empty { C($$); }
| cond_predicate_617 AMPAMPAMP expression_or_cond_pattern { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

case_statement_618:
%empty { C($$); }
| unique_priority
;

case_statement_619:
%empty { C($$); }
| case_statement_619 case_item { $$ = $1; P($$, $2); }
;

case_statement_620:
%empty /* { C($$); } -- ignore */
| unique_priority /* ignore */
;

case_statement_621:
%empty { C($$); }
| case_statement_621 case_pattern_item { $$ = $1; P($$, $2); }
;

case_statement_622:
%empty /* { C($$); } -- ignore */
| unique_priority /* ignore */
;

case_statement_623:
%empty { C($$); }
| case_statement_623 case_inside_item { $$ = $1; P($$, $2); }
;

case_item_624:
%empty { C($$); }
| case_item_624 ',' case_item_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

case_item_625:
%empty { C($$); }
| ':' { C($$); T($$, @1, zero, zero); }
;

case_pattern_item_626:
%empty { C($$); }
| AMPAMPAMP expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

case_pattern_item_627:
%empty { C($$); }
| ':' { C($$); T($$, @1, zero, zero); }
;

case_inside_item_628:
%empty { C($$); }
| ':' { C($$); T($$, @1, zero, zero); }
;

randcase_statement_629:
%empty { C($$); }
| randcase_statement_629 randcase_item { $$ = $1; P($$, $2); }
;

open_range_list_630:
%empty { C($$); }
| open_range_list_630 ',' open_value_range { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

pattern_631:
%empty { C($$); }
| pattern
;

pattern_632:
%empty { C($$); }
| pattern_632 ',' pattern { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

pattern_633:
%empty { C($$); }
| pattern_633 ',' member_identifier ':' pattern { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

assignment_pattern_634:
%empty { C($$); }
| assignment_pattern_634 ',' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

assignment_pattern_635:
%empty { C($$); }
| assignment_pattern_635 ',' structure_pattern_key ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

assignment_pattern_636:
%empty { C($$); }
| assignment_pattern_636 ',' array_pattern_key ':' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

assignment_pattern_637:
%empty { C($$); }
| assignment_pattern_637 ',' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

assignment_pattern_expression_638:
%empty { C($$); }
| assignment_pattern_expression_type
;

assignment_pattern_net_lvalue_639:
%empty { C($$); }
| assignment_pattern_net_lvalue_639 ',' net_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

assignment_pattern_variable_lvalue_640:
%empty { C($$); }
| assignment_pattern_variable_lvalue_640 ',' variable_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

loop_statement_641:
%empty { C($$); }
| for_initialization
;

loop_statement_642:
%empty { C($$); }
| expression
;

loop_statement_643:
%empty { C($$); }
| for_step
;

loop_statement_644:
%empty { C($$); }
| loop_variables
;

for_initialization_645:
%empty { C($$); }
| for_initialization_645 ',' for_variable_declaration { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

for_variable_declaration_646:
%empty { C($$); }
| VAR_ { C($$); T($$, @1, zero, zero); }
;

for_variable_declaration_647:
%empty { C($$); }
| for_variable_declaration_647 ',' variable_identifier '=' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); P($$, $5); }
;

for_step_648:
%empty { C($$); }
| for_step_648 ',' for_step_assignment { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

loop_variables_649:
%empty { C($$); }
| index_variable_identifier
;

loop_variables_650_650:
%empty { C($$); }
| index_variable_identifier
;

loop_variables_650:
%empty { C($$); }
| loop_variables_650 ',' loop_variables_650_650 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

deferred_immediate_assertion_item_652:
%empty /* { C($$); } -- ignore */
| block_identifier ':' /* { $$ = $1; T($$, @2, zero, zero); } -- ignore */
;

clocking_declaration_653:
%empty { C($$); }
| DEFAULT_ /* { C($$); T($$, @1, zero, zero); } -- ignore */
;

clocking_declaration_654:
%empty { C($$); }
| clocking_identifier
;

clocking_declaration_655:
%empty { C($$); }
| clocking_declaration_655 clocking_item { $$ = $1; P($$, $2); }
;

clocking_declaration_656:
%empty { C($$); }
| ':' clocking_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

clocking_declaration_657:
%empty { C($$); }
| clocking_identifier
;

clocking_declaration_658:
%empty { C($$); }
| ':' clocking_identifier { C($$); T($$, @1, zero, zero); P($$, $2); }
;

clocking_item_659:
%empty { C($$); }
| clocking_item_659 attribute_instance { $$ = $1; P($$, $2); }
;

clocking_direction_660:
%empty { C($$); }
| clocking_skew
;

clocking_direction_661:
%empty { C($$); }
| clocking_skew
;

clocking_direction_662:
%empty { C($$); }
| clocking_skew
;

clocking_direction_663:
%empty { C($$); }
| clocking_skew
;

list_of_clocking_decl_assign_664:
%empty { C($$); }
| list_of_clocking_decl_assign_664 ',' clocking_decl_assign { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

clocking_decl_assign_665:
%empty { C($$); }
| '=' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

clocking_skew_666:
%empty { C($$); }
| delay_control
;

clocking_drive_667:
%empty { C($$); }
| cycle_delay
;

randsequence_statement_668:
%empty { C($$); }
| production_identifier
;

randsequence_statement_669:
%empty { C($$); }
| randsequence_statement_669 production { $$ = $1; P($$, $2); }
;

production_670:
%empty /* { C($$); } -- ignore */
| data_type_or_void
;

production_671:
%empty { C($$); }
| '(' tf_port_list ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

production_672:
%empty { C($$); }
| production_672 '|' rs_rule { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

rs_rule_673_673:
%empty { C($$); }
| rs_code_block
;

rs_rule_673:
%empty { C($$); }
| CE weight_specification rs_rule_673_673 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

rs_production_list_675:
%empty { C($$); }
| rs_production_list_675 rs_prod { $$ = $1; P($$, $2); }
;

rs_production_list_676:
%empty { C($$); }
| '(' expression ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

rs_production_list_677:
%empty { C($$); }
| rs_production_list_677 production_item { $$ = $1; P($$, $2); }
;

rs_code_block_678:
%empty { C($$); }
| rs_code_block_678 data_declaration { $$ = $1; P($$, $2); }
;

rs_code_block_679:
%empty { C($$); }
| rs_code_block_679 statement_or_null { $$ = $1; P($$, $2); }
;

production_item_680:
%empty { C($$); }
| '(' list_of_arguments ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

rs_if_else_681:
%empty { C($$); }
| ELSE_ production_item { C($$); T($$, @1, zero, zero); P($$, $2); }
;

rs_case_682:
%empty { C($$); }
| rs_case_682 rs_case_item { $$ = $1; P($$, $2); }
;

rs_case_item_683:
%empty { C($$); }
| rs_case_item_683 ',' case_item_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

rs_case_item_684:
%empty { C($$); }
| ':' { C($$); T($$, @1, zero, zero); }
;

specify_block_685:
%empty { C($$); }
| specify_block_685 specify_item { $$ = $1; P($$, $2); }
;

parallel_path_description_686:
%empty { C($$); }
| polarity_operator
;

full_path_description_687:
%empty { C($$); }
| polarity_operator
;

list_of_path_inputs_688:
%empty { C($$); }
| list_of_path_inputs_688 ',' specify_input_terminal_descriptor { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_path_outputs_689:
%empty { C($$); }
| list_of_path_outputs_689 ',' specify_output_terminal_descriptor { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

specify_input_terminal_descriptor_690:
%empty { C($$); }
| '[' constant_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

specify_output_terminal_descriptor_691:
%empty { C($$); }
| '[' constant_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

parallel_edge_sensitive_path_description_692:
%empty /* { C($$); } -- ignore */
| edge_identifier
;

parallel_edge_sensitive_path_description_693:
%empty { C($$); }
| polarity_operator
;

parallel_edge_sensitive_path_description_694:
%empty { C($$); }
| polarity_operator
;

full_edge_sensitive_path_description_695:
%empty /* { C($$); } -- ignore */
| edge_identifier /* ignore */
;

full_edge_sensitive_path_description_696:
%empty { C($$); }
| polarity_operator
;

full_edge_sensitive_path_description_697:
%empty { C($$); }
| polarity_operator
;

setup_timing_check_698_698:
%empty { C($$); }
| notifier
;

setup_timing_check_698:
%empty { C($$); }
| ',' setup_timing_check_698_698 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

hold_timing_check_700_700:
%empty { C($$); }
| notifier
;

hold_timing_check_700:
%empty { C($$); }
| ',' hold_timing_check_700_700 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

setuphold_timing_check_702_702:
%empty { C($$); }
| notifier
;

setuphold_timing_check_702_703_703:
%empty { C($$); }
| timestamp_condition
;

setuphold_timing_check_702_703_704_704:
%empty { C($$); }
| timecheck_condition
;

setuphold_timing_check_702_703_704_705_705:
%empty { C($$); }
| delayed_reference
;

setuphold_timing_check_702_703_704_705_706_706:
%empty { C($$); }
| delayed_data
;

setuphold_timing_check_702_703_704_705_706:
%empty { C($$); }
| ',' setuphold_timing_check_702_703_704_705_706_706 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

setuphold_timing_check_702_703_704_705:
%empty { C($$); }
| ',' setuphold_timing_check_702_703_704_705_705 setuphold_timing_check_702_703_704_705_706 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

setuphold_timing_check_702_703_704:
%empty { C($$); }
| ',' setuphold_timing_check_702_703_704_704 setuphold_timing_check_702_703_704_705 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

setuphold_timing_check_702_703:
%empty { C($$); }
| ',' setuphold_timing_check_702_703_703 setuphold_timing_check_702_703_704 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

setuphold_timing_check_702:
%empty { C($$); }
| ',' setuphold_timing_check_702_702 setuphold_timing_check_702_703 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

recovery_timing_check_712_712:
%empty { C($$); }
| notifier
;

recovery_timing_check_712:
%empty { C($$); }
| ',' recovery_timing_check_712_712 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

removal_timing_check_714_714:
%empty { C($$); }
| notifier
;

removal_timing_check_714:
%empty { C($$); }
| ',' removal_timing_check_714_714 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

recrem_timing_check_716_716:
%empty { C($$); }
| notifier
;

recrem_timing_check_716_717_717:
%empty { C($$); }
| timestamp_condition
;

recrem_timing_check_716_717_718_718:
%empty { C($$); }
| timecheck_condition
;

recrem_timing_check_716_717_718_719_719:
%empty { C($$); }
| delayed_reference
;

recrem_timing_check_716_717_718_719_720_720:
%empty { C($$); }
| delayed_data
;

recrem_timing_check_716_717_718_719_720:
%empty { C($$); }
| ',' recrem_timing_check_716_717_718_719_720_720 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

recrem_timing_check_716_717_718_719:
%empty { C($$); }
| ',' recrem_timing_check_716_717_718_719_719 recrem_timing_check_716_717_718_719_720 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

recrem_timing_check_716_717_718:
%empty { C($$); }
| ',' recrem_timing_check_716_717_718_718 recrem_timing_check_716_717_718_719 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

recrem_timing_check_716_717:
%empty { C($$); }
| ',' recrem_timing_check_716_717_717 recrem_timing_check_716_717_718 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

recrem_timing_check_716:
%empty { C($$); }
| ',' recrem_timing_check_716_716 recrem_timing_check_716_717 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

skew_timing_check_726_726:
%empty { C($$); }
| notifier
;

skew_timing_check_726:
%empty { C($$); }
| ',' skew_timing_check_726_726 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

timeskew_timing_check_728_728:
%empty { C($$); }
| notifier
;

timeskew_timing_check_728_729_729:
%empty { C($$); }
| event_based_flag
;

timeskew_timing_check_728_729_730_730:
%empty { C($$); }
| remain_active_flag
;

timeskew_timing_check_728_729_730:
%empty { C($$); }
| ',' timeskew_timing_check_728_729_730_730 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

timeskew_timing_check_728_729:
%empty { C($$); }
| ',' timeskew_timing_check_728_729_729 timeskew_timing_check_728_729_730 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

timeskew_timing_check_728:
%empty { C($$); }
| ',' timeskew_timing_check_728_728 timeskew_timing_check_728_729 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

fullskew_timing_check_734_734:
%empty { C($$); }
| notifier
;

fullskew_timing_check_734_735_735:
%empty { C($$); }
| event_based_flag
;

fullskew_timing_check_734_735_736_736:
%empty { C($$); }
| remain_active_flag
;

fullskew_timing_check_734_735_736:
%empty { C($$); }
| ',' fullskew_timing_check_734_735_736_736 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

fullskew_timing_check_734_735:
%empty { C($$); }
| ',' fullskew_timing_check_734_735_735 fullskew_timing_check_734_735_736 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

fullskew_timing_check_734:
%empty { C($$); }
| ',' fullskew_timing_check_734_734 fullskew_timing_check_734_735 { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

period_timing_check_740_740:
%empty { C($$); }
| notifier
;

period_timing_check_740:
%empty { C($$); }
| ',' period_timing_check_740_740 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

width_timing_check_742_742:
%empty { C($$); }
| notifier
;

width_timing_check_742:
%empty { C($$); }
| ',' width_timing_check_742_742 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

nochange_timing_check_744_744:
%empty { C($$); }
| notifier
;

nochange_timing_check_744:
%empty { C($$); }
| ',' nochange_timing_check_744_744 { C($$); T($$, @1, zero, zero); P($$, $2); }
;

timing_check_event_746:
%empty { C($$); }
| timing_check_event_control
;

timing_check_event_747:
%empty { C($$); }
| AMPAMPAMP timing_check_condition { C($$); T($$, @1, zero, zero); P($$, $2); }
;

controlled_timing_check_event_748:
%empty { C($$); }
| AMPAMPAMP timing_check_condition { C($$); T($$, @1, zero, zero); P($$, $2); }
;

edge_control_specifier_749:
%empty { C($$); }
| edge_control_specifier_749 ',' edge_descriptor { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

concatenation_750:
%empty { C($$); }
| concatenation_750 ',' expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

constant_concatenation_751:
%empty { C($$); }
| constant_concatenation_751 ',' constant_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

module_path_concatenation_752:
%empty { C($$); }
| module_path_concatenation_752 ',' module_path_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

streaming_concatenation_753:
%empty /* { C($$); } -- ignore */
| slice_size
;

stream_concatenation_754:
%empty { C($$); }
| stream_concatenation_754 ',' stream_expression { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

stream_expression_755:
%empty { C($$); }
| WITH_ '[' array_range_expression ']' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

tf_call_756:
%empty { C($$); }
| tf_call_756 attribute_instance { $$ = $1; P($$, $2); }
;

tf_call_757:
%empty { C($$); }
| '(' list_of_arguments ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

system_tf_call_758:
%empty { C($$); }
| '(' list_of_arguments ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

system_tf_call_759:
%empty { C($$); }
| ',' expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

subroutine_call_760:
%empty { C($$); }
| stdCC { C($$); T($$, @1, zero, zero); }
;

list_of_arguments_761:
%empty { C($$); }
| expression
;

list_of_arguments_762_762:
%empty { C($$); }
| expression
;

list_of_arguments_762:
%empty { C($$); }
| list_of_arguments_762 ',' list_of_arguments_762_762 { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

list_of_arguments_764_764:
%empty { C($$); }
| expression
;

list_of_arguments_764:
%empty { C($$); }
| list_of_arguments_764 ',' '.' identifier '(' list_of_arguments_764_764 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

list_of_arguments_766:
%empty { C($$); }
| expression
;

list_of_arguments_767_767:
%empty { C($$); }
| expression
;

list_of_arguments_767:
%empty { C($$); }
| list_of_arguments_767 ',' '.' identifier '(' list_of_arguments_767_767 ')' { $$ = $1; T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); P($$, $6); T($$, @7, zero, zero); }
;

method_call_body_769:
%empty /* { C($$); } -- ignore */
| method_call_body_769 attribute_instance { $$ = $1; P($$, $2); }
;

method_call_body_770:
%empty { C($$); }
| '(' list_of_arguments ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

array_manipulation_call_771:
%empty { C($$); }
| array_manipulation_call_771 attribute_instance { $$ = $1; P($$, $2); }
;

array_manipulation_call_772:
%empty { C($$); }
| '(' list_of_arguments ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

array_manipulation_call_773:
%empty { C($$); }
| WITH_ '(' expression ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

randomize_call_774:
%empty { C($$); }
| randomize_call_774 attribute_instance { $$ = $1; P($$, $2); }
;

randomize_call_775_775:
%empty { C($$); }
| variable_identifier_list
| NULL_ { C($$); T($$, @1, zero, zero); }
;

randomize_call_775:
%empty { C($$); }
| '(' randomize_call_775_775 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

randomize_call_777_777_777:
%empty { C($$); }
| identifier_list
;

randomize_call_777_777:
%empty { C($$); }
| '(' randomize_call_777_777_777 ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

randomize_call_777:
%empty { C($$); }
| WITH_ randomize_call_777_777 constraint_block { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); }
;

inc_or_dec_expression_780:
%empty { C($$); }
| inc_or_dec_expression_780 attribute_instance { $$ = $1; P($$, $2); }
;

inc_or_dec_expression_781:
%empty { C($$); }
| inc_or_dec_expression_781 attribute_instance { $$ = $1; P($$, $2); }
;

conditional_expression_782:
%empty { C($$); }
| conditional_expression_782 attribute_instance { $$ = $1; P($$, $2); }
;

constant_expression_783:
%empty { C($$); }
| constant_expression_783 attribute_instance { $$ = $1; P($$, $2); }
;

constant_expression_784:
%empty { C($$); }
| constant_expression_784 attribute_instance { $$ = $1; P($$, $2); }
;

constant_expression_785:
%empty { C($$); }
| constant_expression_785 attribute_instance { $$ = $1; P($$, $2); }
;

expression_786:
%empty { C($$); }
| expression_786 attribute_instance { $$ = $1; P($$, $2); }
;

expression_787:
%empty { C($$); }
| expression_787 attribute_instance { $$ = $1; P($$, $2); }
;

tagged_union_expression_788:
%empty { C($$); }
| expression
;

module_path_conditional_expression_789:
%empty { C($$); }
| module_path_conditional_expression_789 attribute_instance { $$ = $1; P($$, $2); }
;

module_path_expression_790:
%empty { C($$); }
| module_path_expression_790 attribute_instance { $$ = $1; P($$, $2); }
;

module_path_expression_791:
%empty { C($$); }
| module_path_expression_791 attribute_instance { $$ = $1; P($$, $2); }
;

constant_primary_792:
%empty { C($$); }
| '[' constant_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

constant_primary_793:
%empty /* { C($$); } -- ignore */
| package_scope /* ignore */
| class_scope
;

constant_primary_794:
%empty { C($$); }
| '[' constant_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

constant_primary_795:
%empty { C($$); }
| '[' constant_range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

primary_796:
%empty /* { C($$); } -- ignore */
| class_qualifier
| package_scope
;

primary_797:
%empty { C($$); }
| '[' range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

primary_798:
%empty { C($$); }
| '[' range_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

class_qualifier_799:
%empty /* { C($$); } -- ignore */
| localCC { C($$); T($$, @1, zero, zero); }
;

class_qualifier_800:
%empty { C($$); }
| implicit_class_handle '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
;

bit_select_801:
%empty { C($$); }
| bit_select_801 '[' expression ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

select_802_802:
%empty { C($$); }
| select_802_802 '.' member_identifier bit_select { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

select_802:
%empty { C($$); }
| select_802_802 '.' member_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

select_804:
%empty { C($$); }
| '[' part_select_range ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

nonrange_select_805_805:
%empty { C($$); }
| nonrange_select_805_805 '.' member_identifier bit_select { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

nonrange_select_805:
%empty { C($$); }
| nonrange_select_805_805 '.' member_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

constant_bit_select_807:
%empty { C($$); }
| constant_bit_select_807 '[' constant_expression ']' { $$ = $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
;

constant_select_808_808:
%empty { C($$); }
| constant_select_808_808 '.' member_identifier constant_bit_select { $$ = $1; T($$, @2, zero, zero); P($$, $3); P($$, $4); }
;

constant_select_808:
%empty { C($$); }
| constant_select_808_808 '.' member_identifier { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

constant_select_810:
%empty { C($$); }
| '[' constant_part_select_range ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

net_lvalue_811:
%empty { C($$); }
| net_lvalue_811 ',' net_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

net_lvalue_812:
%empty { C($$); }
| assignment_pattern_expression_type
;

variable_lvalue_813:
%empty { C($$); }
| implicit_class_handle '.' { $$ = $1; T($$, @2, zero, zero); }
| package_scope
;

variable_lvalue_814:
%empty { C($$); }
| variable_lvalue_814 ',' variable_lvalue { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

variable_lvalue_815:
%empty { C($$); }
| assignment_pattern_expression_type
;

nonrange_variable_lvalue_816:
%empty /* { C($$); } -- ignore */
| implicit_class_handle '.' /* { $$ = $1; T($$, @2, zero, zero); } -- ignore */
| package_scope /* ignore */
;

attribute_instance_817:
%empty { C($$); }
| attribute_instance_817 ',' attr_spec { $$ = $1; T($$, @2, zero, zero); P($$, $3); }
;

attr_spec_818:
%empty { C($$); }
| '=' constant_expression { C($$); T($$, @1, zero, zero); P($$, $2); }
;

hierarchical_identifier_819:
%empty { C($$); }
| Droot '.' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
;

hierarchical_identifier_820:
%empty { C($$); }
| hierarchical_identifier_820 identifier constant_bit_select '.' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

ps_class_identifier_821:
%empty /* { C($$); } -- ignore */
| package_scope
;

ps_covergroup_identifier_822:
%empty /* { C($$); } -- ignore */
| package_scope /* ignore */
;

ps_checker_identifier_823:
%empty /* { C($$); } -- ignore */
| package_scope
;

ps_identifier_824:
%empty /* { C($$); } -- ignore */
| package_scope
;

ps_or_hierarchical_array_identifier_825:
%empty { C($$); }
| implicit_class_handle '.' { $$ = $1; T($$, @2, zero, zero); }
| class_scope
| package_scope
;

ps_or_hierarchical_net_identifier_826:
%empty /* { C($$); } -- ignore */
| package_scope /* ignore */
;

ps_or_hierarchical_property_identifier_827:
%empty /* { C($$); } -- ignore */
| package_scope /* ignore */
;

ps_or_hierarchical_sequence_identifier_828:
%empty /* { C($$); } -- ignore */
| package_scope
;

ps_or_hierarchical_tf_identifier_829:
%empty /* { C($$); } -- ignore */
| package_scope /* ignore */
;

ps_parameter_identifier_830:
%empty /* { C($$); } -- ignore */
| package_scope /* ignore */
| class_scope
;

ps_parameter_identifier_831_831:
%empty { C($$); }
| '[' constant_expression ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

ps_parameter_identifier_831:
%empty /* { C($$); } -- ignore */
| ps_parameter_identifier_831 generate_block_identifier ps_parameter_identifier_831_831 '.' { $$ = $1; P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

ps_type_identifier_833:
%empty /* { C($$); } -- ignore */
| localCC { C($$); T($$, @1, zero, zero); }
| package_scope /* ignore */
;

c_identifier:
CID_ { C($$); T($$, @1, zero, zero); }
;

escaped_identifier:
EID_ { C($$); T($$, @1, zero, zero); }
;

file_path_spec:
STRING_ { C($$); T($$, @1, zero, zero); }
;

simple_identifier:
CID_ { C($$); T($$, @1, zero, zero); }
| SID_ { C($$); T($$, @1, zero, zero); }
;

string_literal:
STRING_ { C($$); T($$, @1, zero, zero); }
;

system_tf_identifier:
SYSID_ { C($$); T($$, @1, zero, zero); }
;

fixed_point_number:
REAL_NUMBER_ { C($$); T($$, @1, zero, zero); }
;

integral_number:
INTEGRAL_NUMBER_ { C($$); T($$, @1, zero, zero); }
;

real_number:
REAL_NUMBER_ { C($$); T($$, @1, zero, zero); }
;

unbased_unsized_literal:
UNBASED_UNSIZED_LITERAL_ { C($$); T($$, @1, zero, zero); }
;

unsigned_number:
INTEGRAL_NUMBER_ { C($$); T($$, @1, zero, zero); }
;

%%

#include "parser_e.inl"
