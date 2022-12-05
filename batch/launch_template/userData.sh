MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="

--==MYBOUNDARY==
Content-Type: text/cloud-config; charset="us-ascii"

packages:
- amazon-efs-utils

runcmd:
    - [ ls, -l, / ]
    - cert_directory=/etc/cert/tmp
    - echo 'Hello, World!' > /var/tmp/hello-world.txt
    - mkdir -p ${cert_directory}

# This module adds CA certificates to /etc/ca-certificates.conf
ca_certs:
  remove_defaults: false
  trusted:
    - single_line_cert
    - |
      -----BEGIN CERTIFICATE-----
      YOUR-ORGS-TRUSTED-CA-CERT-HERE
      -----END CERTIFICATE-----

# This module handles most configuration for SSH and both host and authorized SSH keys.

write_files:
- path: /etc/cert/tmp/cert.txt
  content: |
    -----BEGIN CERTIFICATE-----
    M1111111111111IBAgIJAKcOSkw0grd/MA0GCSqGSIb3DQEBCwUAMGgxCzAJBgNV
    BAYTAlVTMSUwIwYDVQQKExxTdGFyZmllbGQgVGVjaG5vbG9naWVzLCBJbmMuMTIw
    MAYDVQQLEylTdGFyZmllbGQgQ2xhc3MgMiBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0
    eTAeFw0wOTA5MDIwMDAwMDBaFw0zNDA2MjgxNzM5MTZaMIGYMQswCQYDVQQGEwJV
    UzEQMA4GA1UECBMHQXJpem9uYTETMBEGA1UEBxMKU2NvdHRzZGFsZTElMCMGA1UE
    59vPr5KW7ySaNRB6nJHGDn2Z9j8Z3/VyVOEVqQdZe4O/Ui5GjLIAZHYcSNPYeehu
    VsyuLAOQ1xk4meTKCRlb/weWsKh/NEnAAAAAAAAAAAAAAAAAw=
    -----END CERTIFICATE-----
  owner: 'ec2-user:ec2-user'
  permissions: '0640'
  defer: true

--==MYBOUNDARY==--
