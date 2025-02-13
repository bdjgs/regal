package regal.rules.bugs["constant-condition_test"]

import future.keywords.if

import data.regal.ast
import data.regal.config

import data.regal.rules.bugs["constant-condition"] as rule

test_fail_simple_constant_condition if {
	r := rule.report with input as ast.policy(`allow {
	1
	}`)
	r == {{
		"category": "bugs",
		"description": "Constant condition",
		"location": {"col": 2, "file": "policy.rego", "row": 4, "text": "\t1"},
		"related_resources": [{
			"description": "documentation",
			"ref": config.docs.resolve_url("$baseUrl/$category/constant-condition", "bugs"),
		}],
		"title": "constant-condition",
		"level": "error",
	}}
}

test_success_static_condition_probably_generated if {
	r := rule.report with input as ast.policy(`allow { true }`)
	r == set()
}

test_fail_operator_constant_condition if {
	r := rule.report with input as ast.policy(`allow {
	1 == 1
	}`)
	r == {{
		"category": "bugs",
		"description": "Constant condition",
		"location": {"col": 2, "file": "policy.rego", "row": 4, "text": "\t1 == 1"},
		"related_resources": [{
			"description": "documentation",
			"ref": config.docs.resolve_url("$baseUrl/$category/constant-condition", "bugs"),
		}],
		"title": "constant-condition",
		"level": "error",
	}}
}

test_success_non_constant_condition if {
	r := rule.report with input as ast.policy(`allow { 1 == input.one }`)
	r == set()
}
