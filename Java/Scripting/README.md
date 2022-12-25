# Scripting with Java 11+

You can now use Java as a script file on UNIX systems with the shebang

For my laptop the shebang is `#!/usr/bin/java --source 17`

The shebang should point to the location of the Java binary

The filename should not end with `.java`

Open-JDK Docker image has it's Java binary located at `/usr/openjdk-17/bin/java --source 17`
