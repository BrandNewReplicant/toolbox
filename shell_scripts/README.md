# Shell Scripts

Styling following [Google's Shell Style Guide](https://google.github.io/styleguide/shellguide.html).  
The following formatting can is applied:

```bash
shfmt -ln bash -i 2 -bn -ci -sr -s -d -w <script_name>
```

To be used with [bash](https://www.gnu.org/software/bash/manual/bash.html) > 4.0.
May not be POSIX compliant.

1. [Check for pwned passwords](./password_pwned_check)   
   Inspired by Donald A. Tevault's script in a
   book ["Mastering Linux Security and Hardening"](https://www.packtpub.com/product/mastering-linux-security-and-hardening-third-edition/9781837630516).  
   Can be used is a script or manually:

   ```bash
   passwd_pwned_check <password>
   ```

2. [Set Google DNS as default](./set_google_dns).  
   To run this script, the following command line prompt may be required:

   ```bash
   chmod 700 set_google_dns
   sudo ./set_google_dns
   ```
