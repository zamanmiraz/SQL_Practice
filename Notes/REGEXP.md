# MySQL REGEXP Rules

- **Detail Tutorial Link for MySQL**: [Regular Expressions in SQL Examples](https://www.salvis.com/blog/2018/09/28/regular-expressions-sql-examples/)

## Common REGEXP Rules

- **Beginning of Line or String**: `^`
  - Matches the start of a line or the beginning of a string.

- **End of Line or String**: `$`
  - Matches the end of a line or the end of a string.

- **Any Single Character**: `.`
  - Matches any single character except a newline.

- **Character Class**: `[ ]`
  - Matches any single character within the brackets. For example, `[abc]` matches 'a', 'b', or 'c'.

- **Negated Character Class**: `[^ ]`
  - Matches any single character **not** in the brackets. For example, `[^abc]` matches any character except 'a', 'b', or 'c'.

- **Character Range**: `[a-z]`
  - Matches any single character in the specified range. For example, `[a-z]` matches any lowercase letter.

- **Predefined Character Classes**:
  - `[[:digit:]]` - Matches any digit (0-9).
  - `[[:alpha:]]` - Matches any alphabetic character (a-z, A-Z).
  - `[[:space:]]` - Matches any whitespace character.
  - `[[:upper:]]` - Matches any uppercase letter.
  - `[[:lower:]]` - Matches any lowercase letter.

- **Zero or More Repetitions**: `*`
  - Matches zero or more occurrences of the preceding character.

- **One or More Repetitions**: `+`
  - Matches one or more occurrences of the preceding character.

- **Zero or One Repetition**: `?`
  - Matches zero or one occurrence of the preceding character.

- **Alternation**: `|`
  - Acts as a logical OR. For example, `cat|dog` matches either 'cat' or 'dog'.

- **Grouping**: `( )`
  - Groups characters or expressions. For example, `(abc)+` matches one or more occurrences of 'abc'.

- **Escape Special Characters**: `\`
  - Escapes special characters to match them literally. For example, `\.` matches a period character.

