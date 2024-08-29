# Shell Scripts
Code styling following [Google's Shell Style Guide](https://google.github.io/styleguide/shellguide.html).  
The following formatting can be applied:
```bash
shfmt -ln bash -i 2 -bn -ci -sr -s -d <script_name>
```
To be used with [bash](https://www.gnu.org/software/bash/manual/bash.html) > 4.0.
May not be POSIX compliant.  

## Security:
1. Check for pwned passwords: `./check_pwned_password.sh <password>`   
  Inspired by Donald A. Tevault's script in a book ["Mastering Linux Security and Hardening"](https://www.packtpub.com/product/mastering-linux-security-and-hardening-third-edition/9781837630516)
