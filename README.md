
Markdown
# Security Scanner Script

## Description
This script performs a series of security scans on a target IP address or domain. It uses several tools to gather information and identify potential vulnerabilities.

### Steps Included:
1. **User Input for Target**: The script takes a target IP address or domain from the user. If this argument is not provided, the script shows the correct usage and terminates.
2. **Port Scanning with Nmap**: 
   ```sh
    nmap -sS -sV -T4 -p- $TARGET -oN nmap_scan.txt
This command scans all ports on the target and saves the results to nmap_scan.txt.
3. Web Directory and File Scanning with Dirb:

```sh
dirb http://$TARGET /usr/share/dirb/wordlists/common.txt -o dirb_scan.txt

This command searches for common directories and files on the target web server and saves the results to dirb_scan.txt.

4. Subdomain Discovery with Amass:
```sh
amass enum -d $TARGET -o amass_scan.txt
This command discovers subdomains for the target domain and saves the results to amass_scan.txt.

5. SSL/TLS Security Testing with SSLScan:

sslscan $TARGET > ssl_scan.txt

This command tests the SSL/TLS configuration of the target and saves the results to ssl_scan.txt.

6. Web Technology Detection with WhatWeb:
whatweb $TARGET > whatweb_scan.txt

This command detects technologies used on the target web site and saves the results to whatweb_scan.txt.

7. Web Server Security Scanning with Nikto:

nikto -h $TARGET -output nikto_scan.txt

This command scans the target web server for security vulnerabilities and saves the results to nikto_scan.txt.

8. XSS Scanning with XSSer:

xsser --auto --url http://$TARGET > xsser_scan.txt

This command automatically scans the target web site for XSS vulnerabilities and saves the results to xsser_scan.txt.

Usage
1. Save the Script
Save the above code to a file, for example:


./security_scanner.sh
2. Give Execute Permission
Grant execute permission to the script:

chmod +x security_scanner.sh
3. Run the Script
Use the following command to run the script:


./security_scanner.sh <target_ip_or_domain>
For example:

./security_scanner.sh example.com
Dependencies
Make sure you have the following tools installed on your system:

nmap
dirb
amass
sslscan
whatweb
nikto
xsser
You can install these tools using your package manager, for example:


sudo apt-get install nmap dirb amass sslscan whatweb nikto xsser

Notes
This script is intended for educational purposes and should only be used on targets that you have permission to scan.
Unauthorized scanning of systems may be illegal and result in severe consequences. Always obtain proper authorization before running security scans.
License
This project is licensed under the MIT License.


This `README.md` file provides clear instructions on how to use your security scanner script, along with detailed explanations of each step.
