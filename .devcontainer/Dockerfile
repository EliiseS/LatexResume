#-------------------------------------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See https://go.microsoft.com/fwlink/?linkid=2090316 for license information.
#-------------------------------------------------------------------------------------------------------------

FROM debian:12-slim

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages
RUN apt update \
    && apt -y install --no-install-recommends apt-utils dialog wget ca-certificates 2>&1 \
    # Verify git, process tools, lsb-release (common in install instructions for CLIs) installed
    && apt -y install git procps lsb-release unzip build-essential \
    # Install missing icu-devtools to be able to use liveshare. More info: https://stackoverflow.com/questions/58736399/how-to-get-vscode-liveshare-extension-working-when-running-inside-vscode-remote
    && apt install icu-devtools -y \
    #
    # Clean up
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

# Install TexLive
RUN apt update \
    && apt -y install texlive-full

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog