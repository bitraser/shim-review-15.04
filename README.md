This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your branch
- approval is ready when you have accepted tag

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

-------------------------------------------------------------------------------
What organization or people are asking to have this signed:
-------------------------------------------------------------------------------
[Stellar Information Technology Pvt Ltd]

-------------------------------------------------------------------------------
What product or service is this for:
-------------------------------------------------------------------------------
[BitRaser Data Eraser Software]

-------------------------------------------------------------------------------
What's the justification that this really does need to be signed for the whole world to be able to boot it:
-------------------------------------------------------------------------------
[Stellar requires to employ secure boot for building trusted operating system. This OS has to be capable of booting every machine so that it can be used with BitRaser Data Eraser software.]

-------------------------------------------------------------------------------
Who is the primary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name:Mukesh Kumar
- Position:Project Manager
- Email address:mukeshk@stellarinfo.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the Linux community:NA

-------------------------------------------------------------------------------
Who is the secondary contact for security updates, etc.
-------------------------------------------------------------------------------
- Name:Kuljeet Singh
- Position:Director
- Email address:skuljeet@stellarinfo.com
- PGP key, signed by the other security contacts, and preferably also with signatures that are reasonably well known in the Linux community:NA

-------------------------------------------------------------------------------
Please create your shim binaries starting with the 15.4 shim release tar file:
https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.4 and contains
the appropriate gnu-efi source.
-------------------------------------------------------------------------------
[Yes. used this:- https://github.com/rhboot/shim/releases/download/15.4/shim-15.4.tar.bz2]

-------------------------------------------------------------------------------
URL for a repo that contains the exact code which was built to get this binary:
-------------------------------------------------------------------------------
[https://github.com/bitraser/shim/tree/bitraser-shim15-4]

-------------------------------------------------------------------------------
What patches are being applied and why:
-------------------------------------------------------------------------------
[NA]

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2: is CVE-2020-14372, CVE-2020-25632,
 CVE-2020-25647, CVE-2020-27749, CVE-2020-27779, CVE-2021-20225, CVE-2021-20233,
 CVE-2020-10713, CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311,
 CVE-2020-15705, and if you are shipping the shim_lock module CVE-2021-3418
-------------------------------------------------------------------------------
[using grub 2.06 as above vulnerability is fixed on this version]


-------------------------------------------------------------------------------
What exact implementation of Secureboot in GRUB2 ( if this is your bootloader ) you have ?
* Upstream GRUB2 shim_lock verifier or * Downstream RHEL/Fedora/Debian/Canonical like implementation ?
-------------------------------------------------------------------------------
[shim virify grub and load it then grub load kernel]

-------------------------------------------------------------------------------
If bootloader, shim loading is, GRUB2, and previous shims were trusting affected
by CVE-2020-14372, CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2:
* were old shims hashes provided to Microsoft for verification
  and to be added to future DBX update ?
* Does your new chain of trust disallow booting old, affected by CVE-2020-14372,
  CVE-2020-25632, CVE-2020-25647, CVE-2020-27749,
  CVE-2020-27779, CVE-2021-20225, CVE-2021-20233, CVE-2020-10713,
  CVE-2020-14308, CVE-2020-14309, CVE-2020-14310, CVE-2020-14311, CVE-2020-15705,
  and if you were shipping the shim_lock module CVE-2021-3418
  ( July 2020 grub2 CVE list + March 2021 grub2 CVE list )
  grub2 builds ?
-------------------------------------------------------------------------------
[This is first time submission of shim using shim 15.4]

-------------------------------------------------------------------------------
If your boot chain of trust includes linux kernel, is
"efi: Restrict efivar_ssdt_load when the kernel is locked down"
upstream commit 1957a85b0032a81e6482ca4aab883643b8dae06e applied ?
Is "ACPI: configfs: Disallow loading ACPI tables when locked down"
upstream commit 75b0cea7bf307f362057cc778efe89af4c615354 applied ?
-------------------------------------------------------------------------------
[Yes]

-------------------------------------------------------------------------------
If you use vendor_db functionality of providing multiple certificates and/or
hashes please briefly describe your certificate setup. If there are allow-listed hashes
please provide exact binaries for which hashes are created via file sharing service,
available in public with anonymous access for verification
-------------------------------------------------------------------------------
[NA]

-------------------------------------------------------------------------------
If you are re-using a previously used (CA) certificate, you will need
to add the hashes of the previous GRUB2 binaries to vendor_dbx in shim
in order to prevent GRUB2 from being able to chainload those older GRUB2
binaries. If you are changing to a new (CA) certificate, this does not
apply. Please describe your strategy.
-------------------------------------------------------------------------------
[This is first time submission]

-------------------------------------------------------------------------------
What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as close as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and the differences would be.
-------------------------------------------------------------------------------
[BitRaser OS is a customized OS using arch linux.]

-------------------------------------------------------------------------------
Which files in this repo are the logs for your build?   This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
-------------------------------------------------------------------------------
[https://github.com/bitraser/shim-review-15.4/blob/BitRaserOS-shim-15.4/build.log]

-------------------------------------------------------------------------------
Add any additional information you think we may need to validate this shim
-------------------------------------------------------------------------------
[product url :- https://www.bitraser.com]
