---
title: Public Encryption Signing Keys
permalink: /public-keys
description: >-
  Public keys to send encrypted emails or check the authenticity of a file.
---

Last updated: {{ page.last_modified_at }}

Depending on the situation you might need to use different methods of
communications. To send secure and encrypted messages, use KeyBase, Signal or
other any messaging app with a device that is not compromised.

Use the following keys to encrypt and verify files. The first key for minisign,
pgp and SSH are keys the master key. The second keys does not have a password

[Minisign][1] / [Signify][2] public verification keys:
"8E4D6FA8B1B5E5A6": `RWSm5bWxqG9NjhaaHpQdbt1ZPPlrWG1Q2IP9/PEDM2zjjKHZWfMxyeqZ`
"914AE6568819201": `RWQBkoFoZa4UCTa27U5oYP6Jv1fcp5k9MMYTkDm3LvLgJjHFFzAXKDjK`

[Age][3] public encryption key:
`age1xz8kms3xt2sx05a8rjhwan3fcvltzs6v3jazst2477v5xv3jje4sl4t24n`

[SSH Keys][4] that can be used by age.

PGP to send encrypted emails to set up a secure message conversation. My PGP
Key is at:

- [Mailvelope Keyserver][5]
- [OpenPGP Keyserver][6]

The PGP key ID is:
`6B73 6A21 6E7B E209`

Here is the second PGP Key:

```text
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEYmntlRYJKwYBBAHaRw8BAQdA+Z3a/wHRO33PKIAKza9MzfRuSdfDX5aEB2Hd
VihPSeW0JVNhbXVlbCBXdSA8dHdvcGl6emE5NjIxNTM2QGdtYWlsLmNvbT6ImQQT
FgoAQQIbAwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBDMBwgqBaxw5WDGt
pOYW/tthz4BGBQJiae6YBQkHhkMpAAoJEOYW/tthz4BGMooBAPtU3fo8bzEWhGL7
MFMOo50QP2drSkPK2rBhrtMH6ZT7AQCvAY1nX/SvJRyO8YEq83WQ9SR61gsqvtNh
MjaUcfdGC7g4BGJp7ZUSCisGAQQBl1UBBQEBB0BgfWEOKCC7h8kn3Hv1xl6JHx+D
QKVNS7GtUEuXe5b5XQMBCAeIfgQYFgoAJgIbDBYhBDMBwgqBaxw5WDGtpOYW/tth
z4BGBQJiae6ZBQkHhkMqAAoJEOYW/tthz4BGaHgA/1LnGrWyTxe9tUBz5pbUTQdY
iiB1XyWC7YPXVdjADiCeAQCMc51s1TFX1q7yayl+cAu6W7nLKVH+shVvf1xe+68G
Bg==
=lIZl
-----END PGP PUBLIC KEY BLOCK-----

```

The PGP key ID is:
`E616 FEDB 61CF 8046`

And the signature signed by the first minisign key:

```text
untrusted comment: Signed with 8E4D6FA8B1B5E5A6
RUSm5bWxqG9Njmh2cQtavcGhDde7ew++d4DIh5Iw7nQe7/15MLg1p6t/XKeilfEFDtYYRobJ44VtvB6vIG7p/EDWriR0qKGjUQQ=
trusted comment: PGP Key ID: E616 FEDB 61CF 8046
ELAh12bOPDFM3Ef12ggGUSkOrhSwwAph9jQ9Qfa7Mfx+xMrCy6EUApxES0Uc1qA3XLSleEBGkSDjZ6ef+HyLDw==

```

These should match the bottom half of the fingerprint.

[1]: <https://jedisct1.github.io/minisign>
[2]: <https://github.com/aperezdc/signify>
[3]: <https://age-encryption.org>
[4]: <https://github.com/TwoPizza9621536.keys>
[5]: <https://keys.mailvelope.com>
[6]: <https://keys.openpgp.org>
