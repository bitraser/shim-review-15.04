FROM	archlinux:base-devel-20210627.0.27153

LABEL MAINTAINER 	BitRaser <os _DOT_ bitraser _AT_ stellarinfo _DOT_ com>

LABEL VERSION ="1.0"

LABEL DESCRIPTION ="Docker Image To build Shim 15.04 for BitRaser"

# Update the repositories

RUN	 pacman -Syy


# Install dev packages


RUN	pacman -S --noconfirm git


RUN 	git clone --recursive -b shim-15.4 https://github.com/bitraser/shim.git shim

WORKDIR /shim

RUN 	curl -O  https://raw.githubusercontent.com/bitraser/shim-review-15.4/BitRaserOS-shim-15.4/stellar-pub.cer

RUN 	make VENDOR_CERT_FILE=stellar-pub.cer

RUN 	sha256sum shimx64.efi

RUN	objdump -s -j .sbat shimx64.efi
