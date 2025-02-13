# use-in-operator

**Summary**: Use `in` to check for membership

**Category**: Style

**Avoid**
```rego
package policy

import future.keywords.if

# "Old" way of checking for membership - iteration + comparison
allow if {
    "admin" == input.user.roles[_]
}
```

**Prefer**
```rego
package policy

import future.keywords.if
import future.keywords.in

allow if {
    "admin" in input.user.roles
}
```

## Rationale

Using `in` for membership checks clearly communicates intent, and is less prone to errors. This is especially true when
checking if something is **not** part of a collection.

## Configuration Options

This linter rule provides the following configuration options:

```yaml
rules: 
  style:
    use-in-operator:
      # one of "error", "warning", "ignore"
      level: error
```

## Related Resources

- Rego Style Guide [Use `in` to check for membership](https://github.com/StyraInc/rego-style-guide#use-in-to-check-for-membership)
