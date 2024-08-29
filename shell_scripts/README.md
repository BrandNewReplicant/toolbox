# Automation tools and helpers for Linux
I tend to style my code using [Google's Shell Style Guide](https://google.github.io/styleguide/shellguide.html).  
My scripts are intended to be used with [bash](https://www.gnu.org/software/bash/manual/bash.html) > 4.0 and may not be POSIX compliant.  
My main testing environment is the current Debian stable.  
The shebang is `#!/usr/bin/env bash` to allow for portability across different systems.

## Security:
1. Check for pwned passwords: `./check_pwned_password.sh <password>`   
  Inspired by Donald A. Tevault's script in a book ["Mastering Linux Security and Hardening"](https://www.packtpub.com/product/mastering-linux-security-and-hardening-third-edition/9781837630516)
