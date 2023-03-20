# GNU Privacy Guard for Windows on ARM

This script build the GnuPG 2.4.0 with the following compatibilities,
which is suitable for `git commit` without smart cards:

```
        GnuPG v2.4.0 has been configured as follows:

        Revision:  c0556edb8  (49237)
        Platform:  MingW32 (aarch64-w64-mingw32)

        OpenPGP:   yes
        S/MIME:    yes
        Agent:     yes
        Smartcard: yes (without internal CCID driver)
        TPM:       no
        G13:       no
        Dirmngr:   no
        Keyboxd:   no
        Gpgtar:    yes
        WKS tools: no

        Protect tool:       (default)
        LDAP wrapper:       (default)
        Default agent:      (default)
        Default pinentry:   (default)
        Default scdaemon:   (default)
        Default keyboxd:    (default)
        Default tpm2daemon: (default)
        Default dirmngr:    (default)

        Dirmngr auto start:  yes
        Readline support:    no
        LDAP support:        n/a
        TLS support:         no
        TOFU support:        no
        Tor support:         only .onion
```

## See Also
- https://github.com/dockcross/dockcross
- https://github.com/mstorsjo/llvm-mingw
- https://github.com/msys2/MINGW-packages/pull/13540/files
