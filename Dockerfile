FROM ghcr.io/opentofu/opentofu:minimal AS tofu
FROM public.ecr.aws/amazonlinux/amazonlinux:latest

RUN dnf update -y && dnf upgrade -y
RUN dnf install -y git aws-cli
RUN dnf clean all

COPY --from=tofu /usr/local/bin/tofu /usr/local/bin/tofu 
RUN ln -s /usr/local/bin/tofu /usr/local/bin/terraform

# Create working directory
WORKDIR /workspace

# Verify installations
RUN git --version && \
    aws --version && \
    tofu version && \
    curl --version

# Set default shell to bash
SHELL ["/bin/bash", "-c"]

# Default command
CMD ["/bin/bash"]
